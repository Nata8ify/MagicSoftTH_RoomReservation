package com.n8ify.roomrsv.intf;

import com.n8ify.roomrsv.model.Staff;

public interface RoomsrvAccessInterface {

	public Staff login(String staffId, String password);

	public Staff login(String staffId, String password, String staffType);

	public boolean isRoomReservationAdmin(String staffId);

	public boolean setToStffpsRole(String staffId, String stffpsRole);
}
