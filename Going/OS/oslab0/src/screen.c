#include <am.h>
#include <amdev.h>
#include <test.h>

void update_screen(int board[4][4], int flag) {
		int what = 1;
		while (_device(what) && _device(what)->id != _DEV_VIDEO)
				what++;
		_Device *dev = _device(what);
		_VideoInfoReg info;
		dev->read(_DEVREG_VIDEO_INFO, &info, sizeof(info));
		
		int count = 0;
		for (int i = 0; i < 4; i++)
				for (int j = 0; j < 4; j++)
						if (board[i][j] > 0)
								count++;
		int yy = 100;
		if (count%2 == 0) {
				yy = 381;
				for (int x = 4; x < 46; x++)
						for (int y = 4; y < 46; y++) {
								_FBCtlReg ctl;
								uint32_t pixel = 0x00ffffff;
								if (flag == 1)
									 pixel = 0x0000ff00;
							  else if (flag == 2)
									 pixel = 0x00ff0000;
								ctl.x = 160 / 2 - 25 + x;
								ctl.y = yy - 25 + y;
								ctl.w = ctl.h = 1;
								ctl.sync = 1;
								ctl.pixels = &pixel;
								dev->write(_DEVREG_VIDEO_FBCTL, &ctl, sizeof(ctl));
						}
				yy = 100;
				for (int x = 4; x < 46; x++)
						for (int y = 4; y < 46; y++) {
								_FBCtlReg ctl;
								uint32_t pixel = 0x00ff0000;
								if (flag == 1)
									 pixel = 0x0000ff00;
							  else if (flag == 2)
									 pixel = 0x00ff0000;
								ctl.x = 160 / 2 - 25 + x;
								ctl.y = yy - 25 + y;
								ctl.w = ctl.h = 1;
								ctl.sync = 1;
								ctl.pixels = &pixel;
								dev->write(_DEVREG_VIDEO_FBCTL, &ctl, sizeof(ctl));
						}

		}
		else {
				yy = 100;
				for (int x = 4; x < 46; x++)
						for (int y = 4; y < 46; y++) {
								_FBCtlReg ctl;
								uint32_t pixel = 0x00ffffff;
								if (flag == 1)
									 pixel = 0x0000ff00;
							  else if (flag == 2)
									 pixel = 0x00ff0000;
								ctl.x = 160 / 2 - 25 + x;
								ctl.y = yy - 25 + y;
								ctl.w = ctl.h = 1;
								ctl.sync = 1;
								ctl.pixels = &pixel;
								dev->write(_DEVREG_VIDEO_FBCTL, &ctl, sizeof(ctl));
						}
				yy = 381;
				for (int x = 4; x < 46; x++)
						for (int y = 4; y < 46; y++) {
								_FBCtlReg ctl;
								uint32_t pixel = 0x0000ff00;
								if (flag == 1)
									 pixel = 0x0000ff00;
							  else if (flag == 2)
									 pixel = 0x00ff0000;
								ctl.x = 160 / 2 - 25 + x;
								ctl.y = yy - 25 + y;
								ctl.w = ctl.h = 1;
								ctl.sync = 1;
								ctl.pixels = &pixel;
								dev->write(_DEVREG_VIDEO_FBCTL, &ctl, sizeof(ctl));
						}

		}

		for (int i = 0; i < 4; i++) {
				for (int j = 0; j < 4; j++) {
						for (int x = 0; x < 50; x++) {
								for (int y = 0; y < 50; y++) {
										_FBCtlReg ctl;
										uint32_t pixel = 0x00ffffff;
										if (board[i][j] == 1)	
												pixel = 0x00ff0000;
										else if (board[i][j] == 2)
												pixel = 0x0000ff00;
										ctl.x = 220+j*120 - 25 + x;
										ctl.y = 60+i*120 - 25 + y;
										ctl.w = ctl.h = 1;
										ctl.sync = 1;
										ctl.pixels = &pixel;
										dev->write(_DEVREG_VIDEO_FBCTL, &ctl, sizeof(ctl));
								}
						}
				}
		}
}

void screen_win(int board[4][4], int outcome) {
		int what = 1;
		while (_device(what) && _device(what)->id != _DEV_VIDEO)
				what++;
		_Device *dev = _device(what);
		for (int x = 0; x < 640; x++)
				for (int y = 0; y < 480; y++) {
						_FBCtlReg ctl;
						uint32_t pixel = 0x00ff0000;
						if (outcome == 1) pixel = 0x0000ff00;
						ctl.x = 0 + x;
						ctl.y = 0 + y;
						ctl.w = ctl.h = 1;
						ctl.sync = 1;
						ctl.pixels = &pixel;
						dev->write(_DEVREG_VIDEO_FBCTL, &ctl, sizeof(ctl));
				}
		for (int i = 0; i < 4; i++) {
				for (int j = 0; j < 4; j++) {
						if (board[i][j] == 0)
								board[i][j] = (outcome==1?2:1);
				}
		}
		int flag = outcome;
			
		update_screen(board,flag);								
}
