package
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.geom.ColorTransform;

	public class ShapeMover
	{
		public var theStage: MovieClip;
		public static var mainStage;
		
		public var selector: SpriteSelector;
		public var shape: MyShape;
		
		public function ShapeMover(theStage: MovieClip)
		{
			this.theStage = theStage;
			//ShapeMover.mainStage = theStage;
			
			SpriteSelector.theStage = theStage;
		}		
		
		public function CycleSelection(target: MyShape){
			while(target.parent != theStage){
				target = target.parent as MyShape;
			}
			return target;
		}
		
		public function ReleaseHandler(e: MouseEvent) {
			theStage.removeEventListener(MouseEvent.MOUSE_MOVE, MouseMoveHandler);
			theStage.removeEventListener(MouseEvent.MOUSE_UP, ReleaseHandler);
		}
		
//		public function LeaveHandler(e: MouseEvent) {
//			var target: Sprite = e.target as Sprite;
//			
//			var newCol: ColorTransform = new ColorTransform();
//			newCol.color = defaultColor;
//			target.transform.colorTransform = newCol;
//		}
		
		public function MouseMoveHandler(e: MouseEvent) {
			selector.target.x = theStage.mouseX + selector.target.xOffset;
			selector.target.y = theStage.mouseY + selector.target.yOffset;
			
			trace(selector.target.x + " - x offset: " + selector.target.xOffset);
			trace(selector.target.y + " - y offset: " + selector.target.yOffset);
			
			selector.TrackTarget();
		}
		
		public function ShapeClickHandler(e: MouseEvent) {
			if (e.target != theStage.stage) {
				if(e.target as MyShape != null){
					target = CycleSelection(e.target as MyShape);
					var target: MyShape = e.target as MyShape;
					shape = target;
					target.xOffset = target.x - theStage.mouseX;
					target.yOffset = target.y - theStage.mouseY;
					
					if (selector == null) {
						selector = new SpriteSelector(target);
						
						theStage.addChild(selector);
					}else if(selector.target != target){
						selector.ClearSelection();
						selector = new SpriteSelector(target);
						
						theStage.addChild(selector);
					}
					
					theStage.addEventListener(MouseEvent.MOUSE_MOVE, MouseMoveHandler);
					theStage.addEventListener(MouseEvent.MOUSE_UP, ReleaseHandler);
				}else{
					
					
					shape.xOffset = selector.target.x - theStage.mouseX;
					shape.yOffset = selector.target.y - theStage.mouseY;
					theStage.addEventListener(MouseEvent.MOUSE_MOVE, MouseMoveHandler);
					theStage.addEventListener(MouseEvent.MOUSE_UP, ReleaseHandler);
				} 
			}else{
				if(selector!=null){
					selector.ClearSelection();
					selector = null;
				}
			}
		}
	}
}