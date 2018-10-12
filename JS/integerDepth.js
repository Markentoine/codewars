//
function computeDepth(n) {
	var existingDigits = [];
	var depth = 0;
	while (existingDigits.length < 10) {
		++depth;
		let currentNumber = n * depth;
		let currentNumberDigits = currentNumber.toString()
			.split('')
			.map(digit => +digit);
		    .forEach(function (digit) {
			  if (!existingDigits.includes(digit)) {
			  	existingDigits.push(digit);
			  }
		    });
	}
	return depth;
}

console.log(computeDepth(42));
