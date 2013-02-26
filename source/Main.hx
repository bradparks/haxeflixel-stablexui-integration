package;

import flash.display.Sprite;
import flash.Lib;
import flash.events.Event;
import ru.stablex.ui.UIBuilder;

/**
 * ...
 * @author Zaphod
 */

class Main extends ru.stablex.ui.widgets.Widget{
  //callback to create alert popups
  static public var alert : Dynamic->ru.stablex.ui.widgets.Floating;
        
	static function main() 
	{
		new Main();
	}
	
	public function setupUi_HelloWorld()
  {
      // Simplest example 
      UIBuilder.init();
      Lib.current.stage.addChild( UIBuilder.buildFn('source/hello_world.xml')() );
  }

	public function setupUi_ComplexGUI()
  {
    //register main class to access it's methods and properties in xml
    UIBuilder.regClass('Main');

    //initialize StablexUI
    UIBuilder.init('ui/android/defaults.xml');

    //register skins
    UIBuilder.regSkins('ui/android/skins.xml');

    //create callback for alert popup
    Main.alert = UIBuilder.buildFn('ui/alert.xml');

    //Create our UI
    var ui = UIBuilder.buildFn('ui/index.xml')();
    ui.show();
    Lib.current.stage.addChild(ui);
  }

	public function new() 
	{
		super();

    var demo:TileMapDemo = new TileMapDemo();

    demo.addEventListener(Event.ADDED_TO_STAGE, function(e:Event){
      //setupUi_HelloWorld();
      setupUi_ComplexGUI();
    });
     
    addChild(demo);

		flash.Lib.current.addChild(demo);
	}
}
