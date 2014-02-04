package
{
	public class MyShapeType{
		
		public var Value:int;
		public static const RECTANGLE: MyShapeType = new MyShapeType();
		public static const ELLIPSE: MyShapeType = new MyShapeType();
		
		public static function InitTypes(){
			RECTANGLE.Value = 0;
			ELLIPSE.Value = 1;
		}
	}
}