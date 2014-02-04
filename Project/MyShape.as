package
{
	import flash.display.Sprite;
	import flash.geom.ColorTransform;
	
	public class MyShape extends Sprite
	{
		public var shapeType: MyShapeType
		
		public var color: uint;
		public var xOffset: Number;
		public var yOffset: Number;
		
		public function MyShape(/*shapeType: MyShapeType*/)
		{
			//this.shapeType = shapeType;
			super();
		}
		
		public function BeginColor(newColor:uint){
			this.color = newColor;
			this.graphics.beginFill(color);
		}
		
		public function ChangeColor(newColor:uint){
			var transform: ColorTransform = new ColorTransform();
			transform.color = newColor;
			this.transform.colorTransform = transform;
		}
	}
}