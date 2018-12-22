class UcluCardTextDTO {

UcluCardTextDTO(String masterText,String subText)
{
  this.masterText = masterText;
  this.subText = subText;
}

  String masterText;
  String subText;
}

class UcluCardTextDTO2 {

UcluCardTextDTO2(String masterText,String subText,bool hasDetail)
{
  this.masterText = masterText;
  this.subText = subText;
  this.hasDetail = hasDetail;
}

  String masterText;
  String subText;
  bool hasDetail;
}