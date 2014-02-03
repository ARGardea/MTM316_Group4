package
{
	public class MyShapeType{
		
		public var Value:int;
		public static const SQUARE: MyShapeType = new MyShapeType();
		public static const CIRCLE: MyShapeType = new MyShapeType();
		
		public static function InitTypes(){
			SQUARE.Value = 0;
			CIRCLE.Value = 1;
		}
	}
}