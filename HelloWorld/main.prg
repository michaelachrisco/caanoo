import "mod_text";      // These commands import the necessary functions and variables
import "mod_video";     // to control the program; mod_text = text functions
import "mod_joy";       // mod_video = screen functions / variables
import "mod_key";       // mod_joy and mod_key = joystick and keyboard functions / variables
import "mod_proc";      // mod_proc = process functions like let_me_alone()
import "mod_map";       // mod_map = graphics functions like png_load()

begin                   // This is the beginning of the BennuGD program.
    
    set_fps(60, 0);     // This command sets the Frames Per Second to 60, if possible, and
                        // also tells BennuGD not to skip drawing game frames to maintain
                        // the Frames Per Second (FPS) of the game
    set_mode(320, 240, 16); // This command sets the game to run at 320 pixels wide, 240
                        // pixels tall, and 16-bit color, which GPH's Caanoo uses as well.
    
    write(0, 160, 120, 4, "Hello World!");  // This command writes the string, "Hello World!"
    // to the screen at position 160, 120. The argument '4' designates the alignment of the
    // text (4 = center vertically and center horizontally), while the first argument is the
    // ID of the font object to use. Because it is 0, it will use the built-in font, though
    // we could create a font object using fnt_load or ttf_load and use the number
    // returned from that function instead.
    
    Sprite();           // This runs the Sprite process defined below - a process is kind of
                        // like a class, in that one calls a process to make it run.
                        // Because the sprite function loops, we don't need to constantly call
                        // it inside of the game loop below
    
    loop                // This will loop indefinitely until the game quits - the Game Loop

        if ((joy_numjoysticks() and get_joy_button(0,8) == true) or (key(_ESC) == True) )
                            // If the game receives any quitting action (Home for the
                            // Caanoo or ESC for the PC, it will use...
        
            let_me_alone(); // This function to kill all processes running except this one,
                            // The main one, and then...
                            
            exit();         // it will exit the game.
        
        end
        
        frame;              // This tells BennuGD to pause this process for the current
                            // game frame; When all processes have run, then the next
                            // game frame begins.
        
    end 
end
    
process Sprite();
begin
    
    graph = load_png('sprite.png'); // The 'graph' variable is a built-in variable that
                                    // defines what image this process will display. This
                                    // is essentially a game object, and so has properties
                                    // controlling its position in game as well as how it
                                    // is drawn. So, we set the built-in graph property
                                    // to an external png sprite.
                                    
    x = 160;                        // This sets the position of the center of the sprite
    y = 140;                        // to 160, 140 onscreen;
                                    // notice that the screen starts from 0, 0
                                    // in the top-left corner of the screen and increases
                                    // downwards to the bottom-right corner (320, 240).
    loop
        frame;  // This tells BennuGD to pause this process, like the 'frame;' command
                // above.
    end

end
