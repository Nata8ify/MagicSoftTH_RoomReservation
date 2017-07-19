/* Attributes / Objects */ 
var rooms; //Total Rooms. [GLOBAL]
var reservations; //Total Room's Reservations by Pass, Current and Future. [GLOBAL]
var todayReservations; //Total Reservations on TODAY. [GLOBAL]
var facilities; //Total Facilities which Registered on the System. [GLOBAL]
var users; //Total User on the STFFPF System [GLOBAL]
/* Functions */
/** addRoomUsageDetailById : Use for get Information by Room Id. **/
/* Ps. addRoomUsageDetailById is "Optional" Parameter to be appended Room's Object. */
function addRoomUsageDetailById(roomId, rooms, roomUsage){
//Better $.each and $.each mReservations.
	$.each(rooms , function(index, room){
		if(room.roomId == roomId){
			if(roomUsage !== undefined){roomUsage["room"] = room;}
			return room;
		}
	});
	return null;
}

/* addRoomUsageDetail : Seem 'addRoomUsageDetailById' But Done by 'rooms' and 'roomUsages' */
function addRoomUsageDetail(roomUsages, rooms){
	//Better $.each and $.each mReservations.
	var reservations = [];
	$.each(roomUsages, function(index, roomUsage){
		$.each(rooms , function(index, room){
			if(room.roomId == roomUsage.roomId){
				roomUsage["room"] = room;
				reservations.push(roomUsage);
			}
		});
	});
	return reservations;
}

/* getFacilitiesUsageDetailByUsageId : Get Facility's Detail By Room Usage Id. */
var selectedFacilityDetails; // Contain Current Views Facility's Detail [Supporting Asynchronous $.when [THIS IS BAD BUT WORK]]
function getFacilitiesUsageDetailByUsageId(roomUsageId){
	var facilityDetails = null;
		$.ajax({
			"type" : "post",
			"url" : "reservation/findFacilisUsage",
			"data" : {usageId : roomUsageId},
			"success" : function(results){
				$.when(addFacilityDescription(results)).then(function(){
					facilityDetails = results;
					selectedFacilityDetails = results;
				});
			}
		});
		return facilityDetails;
	}

/* getAvailableRooms : Filter the Available Rooms from a Total Rooms. */
function getAvailableRooms(rooms){
	var availableRooms = [];
	$.each(rooms , function(index, room){
		if(room.isAvailable == true){
			availableRooms.push(room);
		}
	});
	return availableRooms;
}

/* addFacilityDescription : Add the Facility description on Each Facility's Usages. */
function addFacilityDescription(facilitiyUsages){
	$.each(facilitiyUsages, function(index, facilitiyUsage){
		$.each(facilities, function(index, facility){
			if(facility.roomFacilityId == facilitiyUsage.roomFacilityId){
				facilitiyUsage["facility"] = facility;
			}
		});
	});
}

/* getTodayReservations : For Filtering the Reservation by Current Day's Reservation.  */
function getTodayReservations(roomUsages){
	var todayReservations = [];
	var today = new moment().format("YYYY-MM-DD");
	$.each(roomUsages, function(index, roomUsage){
		if(roomUsage.reservedDate == today){
			todayReservations.push(roomUsage);
		}
	});
	return todayReservations;
}

/* @Deprecated - By Using of Serve-side's Logic. */
/* getPassedReservations : For Filtering the Reservation by Reservation that < Current Day's Reservation.  */
function getPassedReservations(roomUsages){
	var passedReservations = [];
	var today = new moment().format("YYYY-MM-DD");
	$.each(roomUsages, function(index, roomUsage){
		if(roomUsage.reservedDate < today){
			todayReservations.push(roomUsage);
		}
	});
	return todayReservations;
}


/* findRoomDetailById : this Function will Return the Room's Detail Object (Usage's Detail and Room Detail) which find by Usage Id.*/
function findRoomDetailByUsageId(usageId){
	var roomDetail = null;
	$.each(currentReservations, function(index, rsvDetail){
		if(rsvDetail.usageId == usageId){
			roomDetail = rsvDetail;
		}
	});
	return roomDetail;
}

/* findUserByStaffId : Get User's Information by their Staff Id. */
function findUserByStaffId(staffId){
	var findUser = null;
	$.each(users, function(index, user){
		if(staffId == user.staffId){
			findUser = user; 
		}
	});
	return findUser;
}


/* Listener / When 'Things' was Occurred. */
$("document").ready(function(){
	//Get Rooms.
	$.ajax({
		"type" : "post",
		"url" : "findRoom/findAllRooms",
		"success" : function(results){
			rooms = results;
			//Get Room's Reservation [Pass, Current and Future].
			$.ajax({
				"type" : "post",
				"url" : "reservation/passed",
				"success" : function(results){
					$.when(addRoomUsageDetail(results, rooms)).then(function(results){
						reservations = results;
						//After the Data is Ready these Function will be Called.
						roomUsagesTable = $("#table-room-usages").DataTable({
         					"data" : reservations,
         					"order" : [["0", "desc"]],
         					"columns" : [{data : "reservedDate", width : "10%"}, {data : "room.roomName", width : "20%"}, {data : "purpose", width : "50%", "orderable": false}, {data : "usageId", width : "20%", "orderable": false }]
         				});
					});
				}
			});	
		}
	});
	//Get Total Users.
	$.ajax({
		"type" : "post",
		"url" : "utils/find/allStaffs",
		"success" : function(results){
			users = results;
		}
	});
	//Get Total Facilities.
	$.ajax({
		"type" : "post",
		"url" : "facility/findAll",
		"success" : function(results){
			facilities = results;
		}
	});

});

/* Report Logic */
function setReportProperties(){
	
}

/* Useful */
function log(thing){
	console.log(thing);
}