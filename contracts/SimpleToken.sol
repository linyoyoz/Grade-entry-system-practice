pragma solidity ^0.4.11;

contract SimpleToken 
	{
  uint256 INITIAL_SUPPLY = 100;

  mapping(address =>string) names;
  mapping(address =>uint256) grades;
  
  function SimpleToken() public 
  {
    grades[msg.sender] = INITIAL_SUPPLY;
	names[msg.sender]="王小明";
  }
  function SetName(address target,string name) public
  {
	  names[target]=name;
  }
  function SetGrade(address target,uint256 grade) public
  {
	  if(grade<=100 && grade>=0)
		grades[target]=grade;
  }
  // transfer token for a specified address
  
  function GetGrade(address target) public constant returns (uint256)
  {
	  return grades[target];
  }
  function IsPass(address _owner) public constant returns (string)
  {
	string off = names[_owner];
	if(grades[_owner]>=60)
		return concat(off," 及格");
	else
		return concat(off," 不及格");
  }
  function concat(string str1, string str2) returns (string)
  {

        bytes memory bs1 = bytes(str1);
        bytes memory bs2 = bytes(str2);

        uint len1 = bs1.length;
        uint len2 = bs2.length;

        string memory temp = new string(len1 + len2);
        bytes memory result = bytes(temp);

        uint index = 0;
        for (uint i = 0; i < len1; i++) {
            result[index++] = bs1[i];

        }
        for (i = 0; i < len2; i++) {
            result[index++] = bs2[i];

        }
        return string(result);
    }
}