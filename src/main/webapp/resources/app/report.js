/* Attributes / Objects */ 
var rooms; //Total Rooms. [GLOBAL]
var reservations; //Total Room's Reservations by Pass, Current and Future. [GLOBAL]
var filteredReservations // Temporary Collection of Total Room's Reservation. [GLOBAL]
var todayReservations; //Total Reservations on TODAY. [GLOBAL]
var facilityUsages; // Total Facility's Usages. [GLOBAL]
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

/* addReserverDetail : This function for Push a User Information into Each Reservation.  */
function addReserverDetail(roomUsages, users){
	var reservations = [];
	$.each(roomUsages, function(index, roomUsage){
		$.each(users, function(index, user){
			if(user.staffId == roomUsage.byStaffId){
				roomUsage["reserver"] = user;
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

/* getFilteredReservationBydate : This Function is for Filtering the reservation By Date or Date Period. */
function getFilteredReservationByDate(roomUsages, date, dateEnd){
	var dateFilteredReservations = [];
	if(date == null && dateEnd == null){
		log(reservations);
		return reservations;
	} else if (date != null && dateEnd == null) {
		$.when($.each(roomUsages , function(index, reservation){
			if(reservation.reservedDate == date){
				dateFilteredReservations.push(reservation);
			}
		})).then(function(noResult){
			log(dateFilteredReservations);
			return dateFilteredReservations;
		});
	} else if (date != null && dateEnd != null) {
		$.when($.each(roomUsages , function(index, reservation){
			if(date <= reservation.reservedDate && reservation.reservedDate <= dateEnd){
				dateFilteredReservations.push(reservation);
			}
		})).then(function(noResult){
			log(dateFilteredReservations);
			return dateFilteredReservations;
		});
	} else {
		alert("No Result Cursed by Missing of Argument");
	}
}

/* getFilteredReservationByTime : This Function for Filtering the Reservations By Specify Time Period. */
function getFilteredReservationByTime(roomUsages , start, end){
	var timeFilteredReservations = [];
	if(start != null && end != null){
		$.when($.each(roomUsages, function(index, roomUsage){
			if(start.concat(":00") <= roomUsage.accessBegin && roomUsage.accessUntil <= end.concat(":00")){
				timeFilteredReservations.push(roomUsage);
			}
		})).then(function(noResult){
			/*filteredReservations = dateFilteredReservations; // Push into filteredReservations.
*/			return timeFilteredReservations; //WAIT > 1000ms
		});
	}
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

/* addFacilityDescription : Add the Facility description on Each Facility's Usages. / PUSHED IN COLLECTION - NO RETURN */
function addFacilityDescription(facilitiyUsages){
	$.each(facilitiyUsages, function(index, facilitiyUsage){
		$.each(facilities, function(index, facility){
			if(facility.roomFacilityId == facilitiyUsage.roomFacilityId){
				facilitiyUsage["facility"] = facility;
			}
		});
	});
}

/* addFacilityUsageDescription : Add the Facility description on Each Facility's Usages for Total of Them. / PUSHED IN COLLECTION - NO RETURN */
function addFacilityDescription(facilitiyUsages, facilities){
	$.each(facilitiyUsages, function(index, facilitiyUsage){
		$.each(facilities, function(index, facility){
			if(facility.roomFacilityId == facilitiyUsage.roomFacilityId){
				facilitiyUsage["facility"] = facility;
			}
		});
	});
}

/* addFacilityUsageToReservations : Add Total Facility's Usage into the Collection of Room Reservations. */
function addFacilityUsageToReservations(roomUsages, facilityUsages){
	$.each(roomUsages, function(index, roomUsage){
		roomUsage["faciliyUsages"] = [];
		$.each(facilityUsages, function(index, facilityUsage){
			if(roomUsage.usageId == facilityUsage.roomUsageId){
				roomUsage["faciliyUsages"].push(facilityUsage);
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
	// Promise Chain (HELL) by Rooms > Reservations > Users > Facility > Facility's Usages
	//1. Get Rooms.
	$.ajax({
		"type" : "post",
		"url" : "findRoom/findAllRooms",
		"success" : function(results){
			rooms = results;
			//2. Get Room's Reservation [Pass, Current and Future].
			$.ajax({
				"type" : "post",
				"url" : "reservation/passed",
				"success" : function(results){
					$.when(addRoomUsageDetail(results, rooms)).then(function(results){
						reservations = results;
						//3. Get Total Users.
						$.ajax({
							"type" : "post",
							"url" : "utils/find/allStaffs",
							"success" : function(results){
								users = results;
								$.when(addReserverDetail(reservations, users)).then(function(results){
									reservations = results; //receiving return results is optional. 
									//4. Get Total Facilities.
									$.ajax({
										"type" : "post",
										"url" : "facility/findAll",
										"success" : function(results){
											facilities = results;
											//5. Get Total Facility's Usages.
											$.ajax({
												"type" : "post",
												"url" : "reservation/findAllFacilisUsage",
												"success" : function(results){
													facilityUsages = results;
													$.when(addFacilityDescription(facilityUsages, facilities)).then(function(noResult){
														$.when(addFacilityUsageToReservations(reservations, facilityUsages)).then(function(noResult){
															filteredReservations = reservations;
														});
													});
												}
											});
										}
									});
								});
							}
						});
						
						console.log(results);
						//After the Data is Ready these Function will be Called.
						roomUsagesTable = $("#table-room-usages").DataTable({
         					"data" : reservations,
         					"order" : [["0", "desc"]],
         					"columns" : [{data : "reservedDate", width : "10%"}, {data : "room.roomName", width : "20%"}, {data : "purpose", width : "60%", orderable: false}, {width : "10%", orderable: false }],
							"columnDefs" : [{
								targets : -1,
								defaultContent : "<button class='btn btn-default btn-report-reservation-detail'>View</button>"
							}],
							language: {
						        searchPlaceholder: "Search records"
						    }
						});
					});
				}
			});	
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