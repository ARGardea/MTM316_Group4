package 
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFieldType;
	import flash.text.TextFormat;

	public class TextBoxes extends Sprite
	{
		var myFormat:TextFormat = new TextFormat();
		var myTextBox: TextField = new TextField();
		
		public function TextBoxes(x:int, y:int, width:int, height:int)
		{
			myFormat.size = 15;
			
			myTextBox.text = "Enter Text Here.";
			myTextBox.type = TextFieldType.INPUT;
			myTextBox.defaultTextFormat = myFormat;
			myTextBox.border = true;
			myTextBox.wordWrap = true;
			
			myTextBox.width = width;
			myTextBox.height = height;
			
			myTextBox.x = x;
			myTextBox.y = y;

			addChild(myTextBox);
		}
		
		public function addToParent()
		{
			addChild(myTextBox);
		}
		
		public function setYLocation(newY:int)
		{
			myTextBox.y = newY;
		}
		
		public function getYLocation():Number
		{
			return myTextBox.y;
		}
		
		public function setXLocation(newX:int)
		{
			myTextBox.x = newX;
		}
		
		public function getXLocation():Number
		{
			return myTextBox.x;
		}
		
		public function setBoxHeight(newHeight:int)
		{
			myTextBox.height = newHeight;
		}
		
		public function getBoxHeight():Number
		{
			return myTextBox.height;
		}
		
		public function setBoxWidth(newWidth:int)
		{
			myTextBox.width = newWidth;
		}
		
		public function getBoxWidth():Number
		{
			return myTextBox.width;
		}
		
		public function flipBorder()
		{
			if(myTextBox.border == true)
			{
				myTextBox.border = false;
			}
			else
			{
				myTextBox.border = true;
			}
		}
		
		public function setText(newText:String)
		{
			myTextBox.text = newText;
		}
		
		public function getText():String
		{
			return myTextBox.text;
		}
	}
}