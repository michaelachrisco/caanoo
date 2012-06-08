PROGRAM controls;
import "mod_video";
import "mod_joy";
import "mod_text";
import "mod_proc";

GLOBAL
buttons[7][22];
axes[7][22];
hats[7][22];
balls[7][22][1];
accel[7][2];

BEGIN
    set_mode(320,240,16);

    write(0,160,230,4,"*** PRESS L + R FOR EXIT *** Hello world");

    FROM y=0 to JOY_NUMJOYSTICKS()-1;
        from x = 0 to JOY_NUMBUTTONS( y ) -1;
            if ( y == 0 ) write(0,10,10+(x*10),4,x+" :"); end
            write_int(0,40+(y*30),10+(x*10),4,& buttons[y][x]);
        end
        from x = 0 to JOY_AXES( y ) -1;
            if ( y == 0 ) write(0,160,10+(x*10),4,x+" :"); end
            write_int(0,190+(y*60),10+(x*10),4,&axes[y][x]);
        end
        from x = 0 to JOY_NUMHATS( y ) -1;
            if ( y == 0 ) write(0,160,60+(x*10),4,x+" :"); end
            write_int(0,190+(y*60),60+(x*10),4,&hats[y][x]);
        end
        from x = 0 to JOY_NUMBALLS( y ) -1;
            if ( y == 0 ) write(0,160,160+(x*10),4,x+" :"); end
            write_int(0,190+(y*60),160+(x*10),4,&balls[y][x][0]);
            write_int(0,220+(y*60),160+(x*10),4,&balls[y][x][1]);
        end
        from x = 0 to 2;
            write_int(0,160+(x*30),200+(y*10),4,&accel[y][x]);
        end
    END

    LOOP

        FROM y=0 to JOY_NUMJOYSTICKS()-1;
            from x = 0 to JOY_NUMBUTTONS( y ) -1;
                buttons[y][x]=get_joy_button(y,x);
            end
            from x = 0 to JOY_AXES( y ) -1;
                axes[y][x]=JOY_GETAXIS(y, x);
            end
            from x = 0 to JOY_NUMHATS( y ) -1;
                hats[y][x]=JOY_GETHAT(y,x);
            end
            from x = 0 to JOY_NUMBALLS( y ) -1;
                JOY_GETBALL(y,x,&balls[y][x][0],&balls[y][x][1]);
            end
            joy_getaccel(y,&accel[y][0],&accel[y][1],&accel[y][2]);
        END
        IF (get_joy_button(0,10) && get_joy_button(0,11)) exit(); END

        FRAME;
    END
END
