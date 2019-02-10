//
function computeDepth1(n) {
	var existingDigits = [];
	var depth = 0;
	while (existingDigits.length < 10) {
		++depth;
		let currentNumber = n * depth;
		currentNumber.toString()
			.split('')
			.map(digit => +digit)
		    .forEach(function (digit) {
			  if (!existingDigits.includes(digit)) {
			  	existingDigits.push(digit);
			  }
		    });
	}
	return depth;
}

function computeDepth3(number) {
	var digits;
	var multiple;
	var lookupDigits = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
	var i = 1;
	var depth = 0;

	while (lookupDigits.length !== 0) {
		multiple = number * i;
		i++;
		depth++
		digits = String(multiple).split('').map(function (strDigit) {
			return parseInt(strDigit, 10);
		});

		lookupDigits = lookupDigits.reduce((result, digit) => {
			if (!digits.includes(digit)) {
				result.push(digit);
			}
			return result;
		}, []);
		console.log(lookupDigits);
	}

	return depth;
}


function computeDepth4(n) {
	function* makeMultiplesDigits(n) {
		let operand = 1;
		while (true) {
			yield String(n * operand++).split('');
		}
	}
	const nMutltipleDigits = makeMultiplesDigits(n);
	let digits = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'].reduce((result, d) => ({...result, [d]: null }),{});
	let depth = 0;
	while (Object.keys(digits).length > 0) {
		nMutltipleDigits.next().value.forEach(d => delete digits[d]);
		depth++;
	}
	return depth;
}

function computeDepth5(n) {
	function* makeMultiplesDigits(n) {
		let operand = 1;
		while (true) {
			yield String(n * operand++).split('');
		}
	}
	const nMutltipleDigits = makeMultiplesDigits(n);
	let digits = new Set(['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']);
	while (digits.size > 0) {
		nMutltipleDigits.next().value.forEach(d => digits.delete(d));
		nMutltipleDigits.depth = nMutltipleDigits.depth ? ++nMutltipleDigits.depth : 1;
	}
	return nMutltipleDigits.depth;
}

function computeDepth(n) {
	function* diveDeeper(n, digits = new Set(['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'])) {
		let factor = 1;
		while (digits.size > 0) {
			String(n * factor).split('').forEach(d => digits.delete(d))
			yield factor++;
		}
	}
	const nDiveDeeper = diveDeeper(n);
	let [depth, currentDepth] = [{done: null}, 0];
	while (!depth.done) [currentDepth, depth] = [ depth.value, nDiveDeeper.next()];
	return currentDepth;
}

console.log(computeDepth(1))