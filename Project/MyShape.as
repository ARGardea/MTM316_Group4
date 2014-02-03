package
{
	import flash.display.Sprite;
	
	public class MyShape extends Sprite
	{
		public var shapeType: MyShapeType
		
		public function MyShape(shapeType: MyShapeType)
		{
			this.shapeType = shapeType;
			super();
		}
	}
}