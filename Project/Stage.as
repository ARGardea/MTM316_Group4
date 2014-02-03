package {
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
		var ChangeColor: ColorTransform;
		var BasicShape: Sprite;
		var MouseTracker: Sprite;
		var shape: Sprite;
		
		public function Stage() {
			MasterMC = new Master_MC();
			ChangeColor = new ColorTransform();
			MasterMC.x = 0;
			MasterMC.y = 0;

			SetupButtons();
			SetupTools();

			MasterMC.DrawingStage.addEventListener(MouseEvent.MOUSE_MOVE, MouseOverStage);
			MasterMC.DrawingStage.addEventListener(MouseEvent.MOUSE_OUT, MouseOutOfStage);
			MasterMC.gotoAndStop(1);

			addChild(MasterMC);
		}
		
		function CircleToolButtonPressed() {
			MasterMC.gotoAndStop(2);
			MouseTracker = DrawBasicShape(18, 18, 10, 10, 0x000000);
			DrawBasicShapeOnStage();
		}


		function DrawBasicShape(_x: int, _y: int, _width: int, _height: int, _fill: int) : Sprite {
			BasicShape = new Sprite();
			
			BasicShape.graphics.clear();
			
			
			BasicShape.graphics.beginFill(_fill);
			
			if (MasterMC.currentFrame == 2)
				BasicShape.graphics.drawEllipse(_x, _y, _width, _height);
			else if (MasterMC.currentFrame == 3)
				BasicShape.graphics.drawRect(_x, _y, _width, _height);
			
			BasicShape.graphics.endFill();
			
			return BasicShape;
		}
		
		function DrawBasicShapeOnStage() {
			MouseTracker.x = MasterMC.mouseX;
			MouseTracker.y = MasterMC.mouseY;			
			
			AddDrawingEvents();
			SetupPreviewShape();
			addChild(MouseTracker);
		}
		
		function AddDrawingEvents() {
			MasterMC.addEventListener(MouseEvent.MOUSE_MOVE, MoveMouseTracker);			
			MasterMC.DrawingStage.addEventListener(MouseEvent.CLICK, DrawBasicShapeOnClick);
			MasterMC.DrawingStage.addEventListener(MouseEvent.MOUSE_MOVE, UpdateXYTextField);
			MasterMC.TextFieldBasicShapeFill.addEventListener(Event.CHANGE, UpdateShapePreview);
		}
		
	/*	function RandomColor(): Number {
			
		}*/
		
		function RectangleToolButtonPressed() {
			MasterMC.gotoAndStop(3);
			
			MouseTracker = DrawBasicShape(17, 17, 9, 9, 0x000000);
			DrawBasicShapeOnStage();
		}
		
		function SelectorToolButtonPressed() {
			MasterMC.gotoAndStop(1);
		}
		
		function SetupButtons() {
			Buttons = new Array(4);

			Buttons[0] = MasterMC.FileButton;
			Buttons[1] = MasterMC.EditButton;
			Buttons[2] = MasterMC.ImageButton;
			Buttons[3] = MasterMC.ViewButton;

			SetupButtonText();
		}
		
		function SetupButtonText() {
			ButtonTexts = new Array(4);

			ButtonTexts[0] = MasterMC.FileButtonText;
			ButtonTexts[1] = MasterMC.EditButtonText;
			ButtonTexts[2] = MasterMC.ImageButtonText;
			ButtonTexts[3] = MasterMC.ViewButtonText;
		}
		
		function SetupPreviewShape() {
			if (shape == null) {
				shape = DrawBasicShape(15, 6, 50, 50, MasterMC.TextFieldBasicShapeFill.text);
				MasterMC.ShapePreview.addChild(shape);
			} else {
				if (MasterMC.ShapePreview.contains(shape))
					MasterMC.ShapePreview.removeChild(shape);
				shape = DrawBasicShape(15, 6, 50, 50, MasterMC.TextFieldBasicShapeFill.text);
				MasterMC.ShapePreview.addChild(shape);
			}
		}
		
		function SetupTools() {
			Tools = new Array(6);

			Tools[0] = MasterMC.CircleTool;
			Tools[1] = MasterMC.RectangleTool;
			Tools[2] = MasterMC.LineTool;
			Tools[3] = MasterMC.TextTool;
			Tools[4] = MasterMC.TriangleTool;
			Tools[5] = MasterMC.SelectorTool;

			SetupToolsIcons();

			for (var index: int = 0; index < Tools.length; index++) {
				Tools[index].addEventListener(MouseEvent.MOUSE_MOVE, ToolButtonMouseOver);
				Tools[index].addEventListener(MouseEvent.MOUSE_OUT, ToolButtonMouseOut);
				Tools[index].addEventListener(MouseEvent.MOUSE_DOWN, ToolButtonMouseDown);
				Tools[index].addEventListener(MouseEvent.MOUSE_UP, ToolButtonMouseUp);
			}
		}
		
		function SetupToolsIcons() {
			ToolIcons = new Array(6);

			ToolIcons[0] = MasterMC.CircleToolIcon;
			ToolIcons[1] = MasterMC.RectangleToolIcon;
			ToolIcons[2] = MasterMC.LineToolIcon;
			ToolIcons[3] = MasterMC.TextToolIcon;
			ToolIcons[4] = MasterMC.TriangleToolIcon;
			ToolIcons[5] = MasterMC.SelectorToolIcon;
		}
		
		function UpdateShapePreview(e: Event) {
			SetupPreviewShape();
		}

		function DrawBasicShapeOnClick(e: MouseEvent) {
			var shape: Sprite = DrawBasicShape(MasterMC.MouseX.text, MasterMC.MouseY.text, MasterMC.TextFieldBasicShapeWidth.text, MasterMC.TextFieldBasicShapeHeight.text, MasterMC.TextFieldBasicShapeFill.text);
			MasterMC.DrawingStage.addChild(shape);
		}

		function MouseOutOfStage(e: MouseEvent) {
			MasterMC.LineX.visible = false;
			MasterMC.LineY.visible = false;
		}
		
		function MouseOverStage(e: MouseEvent) {
			MasterMC.MouseX.text = MasterMC.DrawingStage.mouseX;
			MasterMC.MouseY.text = MasterMC.DrawingStage.mouseY;

			MasterMC.LineX.visible = true;
			MasterMC.LineX.x = MasterMC.DrawingStage.mouseX + 50;

			MasterMC.LineY.visible = true;
			MasterMC.LineY.y = MasterMC.DrawingStage.mouseY + 100;
		}		
		
		function MoveMouseTracker(e: MouseEvent) {
				MouseTracker.x = MasterMC.mouseX;
				MouseTracker.y = MasterMC.mouseY;
		}
		
		function RemoveDrawingEvents() {
			MasterMC.DrawingStage.removeEventListener(MouseEvent.MOUSE_MOVE, UpdateXYTextField);
			MasterMC.removeEventListener(MouseEvent.MOUSE_MOVE, MoveMouseTracker);

			MasterMC.DrawingStage.removeEventListener(MouseEvent.CLICK, DrawBasicShapeOnClick);
			if (MouseTracker != null && contains(MouseTracker))
				removeChild(MouseTracker);
		}
		
		function ToolButtonMouseDown(e: MouseEvent) {
			ChangeColor.color = 0x993830;
			e.currentTarget.transform.colorTransform = ChangeColor;

			if (e.currentTarget.name == "CircleTool") {
				RemoveDrawingEvents();
				CircleToolButtonPressed();
			}
			else if (e.currentTarget.name == "RectangleTool") {
				RemoveDrawingEvents();
				RectangleToolButtonPressed();
				
			}
			else if (e.currentTarget.name == "SelectorTool") {
				SelectorToolButtonPressed();
				RemoveDrawingEvents();
			}
		}
		
		function ToolButtonMouseOut(e: MouseEvent) {
			ChangeColor.color = 0x443835;
			e.currentTarget.transform.colorTransform = ChangeColor;
		}
	
		function ToolButtonMouseOver(e: MouseEvent) {
			ChangeColor.color = 0x663835;
			e.currentTarget.transform.colorTransform = ChangeColor;
		}

		function ToolButtonMouseUp(e: MouseEvent) {
			ChangeColor.color = 0x663835;
			e.currentTarget.transform.colorTransform = ChangeColor;
		}
		
		function UpdateXYTextField(e: MouseEvent) {
			MasterMC.TextFieldBasicShapeX.text = MasterMC.MouseX.text;
			MasterMC.TextFieldBasicShapeY.text = MasterMC.MouseY.text;
		}
	}	
}