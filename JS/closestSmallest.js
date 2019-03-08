//Trouver quels chiffres dans la liste fournie ont la différence de poids la plus faible, le poids le plus fabile, 
//et l'index le plus bas.

// Datastructure: string -> array 

// ALGO:
// compute weigths : sum of digits
// sort this array



const closest = str => {
    if (str === '') return [];
    const originalArray = str.split(' ');
    const weights = originalArray.map((v, idx) => {
        return {
            'weight': weight(v),
            'originalIdx': idx,
            'value': +v
        }
    });
    const sortedWeights = weights.sort((a, b) => {
        if (b.weight === a.weight) {
            return b.originalIdx - a.originalIdx;
        } else {
            return b.weight - a.weight;
        }
    });
    computeDiff(sortedWeights);
    const match = findMatch(sortedWeights);
    const indexMatch = sortedWeights.indexOf(match);
    const pairMatch = sortedWeights[indexMatch + 1];
    return [
        [match.weight, match.originalIdx, match.value],
        [pairMatch.weight, pairMatch.originalIdx, pairMatch.value]
    ].sort((a, b) => {
        if (a[0] === b[0]) {
            return a[1] - b[1];
        } else {
            return a[0] - b[0];
        }
    });
};

const weight = str => {
    const digits = str.split('');
    return digits.reduce((result, d) => {
        result += +d;
        return result;
    }, 0)
};

const computeDiff = a => {
    a.forEach((e, idx) => {
        const diff = a[idx + 1] ? e.weight - a[idx + 1].weight : NaN;
        e['diff'] = diff;
    });
};

const findMatch = a => {
    return a.reduce((match, e) => {
        if (match) {
            if (e.diff <= match.diff) {
                match = e;
            }
        } else {
            match = e;
        }
        return match;
    });
};

closest("456899 50 11992 176 272293 163 389128 96 290193 85 52"); // [ 4, 6, 16, 18, 2 ]s