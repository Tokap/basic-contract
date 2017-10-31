pragma solidity ^0.4.4;

library ConvertLib{
	// Convery between denomination values
	function convert(uint amount,uint conversionRate) returns (uint convertedAmount)
	{
		return amount * conversionRate;
	}

	function bytes32ToString(bytes32 x) constant returns (string) {
		// Create container for max-sized bytestring & Counter for actual length
    bytes memory bytesString = new bytes(32);
    uint charCount = 0;
		// Iterate through
    for (uint j = 0; j < 32; j++) {
				// Access the individual byte. If it's there, update or byteString & charCount
        byte char = byte(bytes32(uint(x) * 2 ** (8 * j)));
        if (char != 0) {
            bytesString[charCount] = char;
            charCount++;
        }
    }
		// Another round through, this time using charCount to max our loop & trim empty space
    bytes memory bytesStringTrimmed = new bytes(charCount);
    for (j = 0; j < charCount; j++) {
        bytesStringTrimmed[j] = bytesString[j];
    }
		// Convert trimmed byteString into a string
    return string(bytesStringTrimmed);
	}
}
