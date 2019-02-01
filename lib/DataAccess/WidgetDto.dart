class UcluCardTextDTO {

UcluCardTextDTO(String masterText,String subText)
{
  this.masterText = masterText;
  this.subText = subText;
}

  String masterText;
  String subText;
}


class AssitReportDataDTO{

  AssitReportDataDTO(String header, String value, bool clickable)
  {
this.header = header;
this.value = value;
this.clickable = clickable;
  }

String header;
String value; 
bool clickable;

}