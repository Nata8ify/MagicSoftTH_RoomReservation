/* Attributes / Objects */ 
var rooms; //Total Rooms. [GLOBAL]
var currentReservations; //Total Current Room's Reservations by Current and Future. [GLOBAL]
var todayReservations; //Total Reservations on TODAY. [GLOBAL]
var comingReservations; //Total Coming's Reservations. [GLOBAL]
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

/** addRoomUsageDetail : Seem 'addRoomUsageDetailById' But Done by 'rooms' and 'roomUsages' **/
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

/* getComingReservations : For Filtering the Reservation by Coming's Reservation (Pass and Current Day isn't Included.)  */
function getComingReservations(roomUsages){
	var comingReservations = [];
	var today = new moment().format("YYYY-MM-DD");
	$.each(roomUsages, function(inedx, roomUsage){
		if(roomUsage.reservedDate > today){
			comingReservations.push(roomUsage);
		}
	});
	return comingReservations;
}

/* Listener / When 'Things' was Occurred. */
$("document").ready(function(){
	//Get Rooms.
	$.ajax({
		"type" : "post",
		"url" : "findRoom/findAllRooms",
		"success" : function(results){
			rooms = results;
			//Get Room's Reservation [Current and Future]
			$.ajax({
				"type" : "post",
				"url" : "reservation/all",
				"data" : {isPassInclude : false},
				"success" : function(results){
					$.when(addRoomUsageDetail(results, rooms)).then(function(results){
						currentReservations = results;
						todayReservations = getTodayReservations(currentReservations);
						comingReservations = getComingReservations(currentReservations);
						//After the Data is Ready these Function will be Called.
						setUpTodayReservationTable(todayReservations);
						setUpComingReservationTable(comingReservations);					
						});

				}
			});
		}
	});
});


/* Useful */
function log(thing){
	console.log(thing);
}