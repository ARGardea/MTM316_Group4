package  {
	import flash.display.MovieClip;
	import flash.events.*;
	import fl.motion.MotionEvent;
	import flash.display.Sprite;
	import flash.geom.ColorTransform;
	
	public class Stage extends MovieClip {

		var MasterMC: MovieClip;
		
		var Buttons: Array;
		var ButtonTexts: Array;
		var Tools: Array;
		var ToolIcons: Array; 
		
		var CircleProp: Array;
		
		var MouseTracker: Sprite;
		
		public function Stage() {
			MasterMC = new Master_MC();
			
			MasterMC.x = 0;
			MasterMC.y = 0;

			SetupButtons();
			SetupTools();	
			
			MasterMC.DrawingStage.addEventListener(MouseEvent.MOUSE_MOVE, MouseOverStage);
			MasterMC.DrawingStage.addEventListener(MouseEvent.MOUSE_OUT, MouseOutOfStage);
			MasterMC.gotoAndStop(1);
			
			addChild(MasterMC);
			
		}
		
		function MouseOutOfStage(e:MouseEvent) {
			MasterMC.LineX.visible = false;
			MasterMC.LineY.visible = false;
		}
		
		function MouseOverStage(e:MouseEvent): void {
			MasterMC.MouseX.text = MasterMC.DrawingStage.mouseX;
			MasterMC.MouseY.text = MasterMC.DrawingStage.mouseY;
			
			MasterMC.LineX.visible = true;
			MasterMC.LineX.x = MasterMC.DrawingStage.mouseX + 50;
			
			MasterMC.LineY.visible = true;
			MasterMC.LineY.y = MasterMC.DrawingStage.mouseY + 100;
		}
		
		function SetupTools(){
			Tools = new Array(6);
			
			Tools[0] = MasterMC.CircleTool;
			Tools[1] = MasterMC.RectangleTool;
			Tools[2] = MasterMC.LineTool;
			Tools[3] = MasterMC.TextTool;
			Tools[4] = MasterMC.TriangleTool;
			Tools[5] = MasterMC.SelectorTool;
			
			SetupToolIcons();
			
			for (var index:int = 0; index < Tools.length; index++){
				Tools[index].addEventListener(MouseEvent.MOUSE_MOVE, ToolButtonMouseOver);
				Tools[index].addEventListener(MouseEvent.MOUSE_OUT, ToolButtonMouseOut);
				Tools[index].addEventListener(MouseEvent.MOUSE_DOWN, ToolButtonMouseDown);
				Tools[index].addEventListener(MouseEvent.MOUSE_UP, ToolButtonMouseUp);
				
			/*	Tools[index].addChild(ToolIcons[index]);  */                                                                                                                                                                                                              
			}
		}
		
		function SetupToolIcons() {
			
			ToolIcons = new Array(6);
			
			ToolIcons[0] = MasterMC.CircleToolIcon;
			ToolIcons[1] = MasterMC.RectangleToolIcon;
			ToolIcons[2] = MasterMC.LineToolIcon;
			ToolIcons[3] = MasterMC.TextToolIcon;
			ToolIcons[4] = MasterMC.TriangleToolIcon;
			ToolIcons[5] = MasterMC.SelectorToolIcon;
		}
		
		function SetupButtons() {
			Buttons = new Array(4);
			
			Buttons[0] = MasterMC.FileButton;
			Buttons[1] = MasterMC.EditButton;
			Buttons[2] = MasterMC.ImageButton;
			Buttons[3] = MasterMC.ViewButton;
			
			SetupButtonText();
			
		/*	for (var index:int = 0; index < Buttons.length; index++)
				Buttons[index].addChild(ButtonTexts[index]);        */
		}
		
		function SetupButtonText() {
			ButtonTexts = new Array(4);
			
			ButtonTexts[0] = MasterMC.FileButtonText;
			ButtonTexts[1] = MasterMC.EditButtonText;
			ButtonTexts[2] = MasterMC.ImageButtonText;
			ButtonTexts[3] = MasterMC.ViewButtonText;
		}
		
		function ToolButtonMouseOver(e:MouseEvent){
			var newCol:ColorTransform = new ColorTransform();
			newCol.color = 0x663835;
			e.currentTarget.transform.colorTransform = newCol;
		}
		
		function ToolButtonMouseOut(e:MouseEvent) {
			var newCol:ColorTransform = new ColorTransform();
			newCol.color = 0x443835;
			e.currentTarget.transform.colorTransform = newCol;
		}
		
		function ToolButtonMouseDown(e:MouseEvent) {
			var newCol:ColorTransform = new ColorTransform();
			newCol.color = 0x993830;
			e.currentTarget.transform.colorTransform = newCol;
			
			if (e.currentTarget.name == "CircleTool") {
				DrawMouseTracker();
			}
		}

		function ToolButtonMouseUp(e:MouseEvent) {
			var newCol:ColorTransform = new ColorTransform();
			newCol.color = 0x663835;
			e.currentTarget.transform.colorTransform = newCol;
		}
		
		function DrawMouseTracker() {

			MasterMC.gotoAndStop(2);
			
			MouseTracker = new Sprite();
			MouseTracker.x = MasterMC.mouseX;
			MouseTracker.y = MasterMC.mouseY;
			
			MouseTracker.graphics.clear();
			MouseTracker.graphics.beginFill(0xFFFFFF);
			MouseTracker.graphics.drawCircle(20, 20, 5);
			MouseTracker.graphics.endFill();
			MasterMC.addEventListener(MouseEvent.MOUSE_MOVE, MoveMouseTracker);
			
			addChild(MouseTracker);
			
			MasterMC.DrawingStage.addEventListener(MouseEvent.CLICK, DrawCircle);
		}
		
		function DrawCircle(e:MouseEvent) {

			
			var Circle:Sprite = new Sprite();
			
			
			Circle.graphics.clear();
			//trace(MasterMC.PropCircle0xValue.text);
			Circle.graphics.beginFill(MasterMC.PropCircleFillValue.text);
			Circle.graphics.drawEllipse(MasterMC.MouseX.text, MasterMC.MouseY.text, MasterMC.PropCircleWidthValue.text, MasterMC.PropCircleHeightValue.text);
			Circle.graphics.endFill();
			
			MasterMC.PropCircleXValue.text = MasterMC.MouseX.text;
			MasterMC.PropCircleYValue.text = MasterMC.MouseY.text;
			MasterMC.DrawingStage.addChild(Circle);
		}
		
		function MoveMouseTracker(e: MouseEvent): void {
			MouseTracker.x = MasterMC.mouseX;
			MouseTracker.y = MasterMC.mouseY;
		}
	}	
	
}
