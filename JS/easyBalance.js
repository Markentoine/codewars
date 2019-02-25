const removeEmptyLines = lines => {
    return lines.reduce((result, line) => {
        if (/./.test(line)) {
            result.push(line);
        }
        return result;
    }, [])
};

const sanitizeLines = lines => {
    return lines.map(line => {
        return line.replace(/[^A-Z0-9.\s]/ig, '')
    });
};

const balance = book => {
    const lines = book.split('\n');
    const validLines = removeEmptyLines(lines);
    const sanitizedLines = sanitizeLines(validLines);
    const originalBalance = parseFloat(sanitizedLines[0]);
    const cuttedLines = sanitizedLines.map(l => {
        return l.replace(/\d+\.\d+/, '')
    });
    let currentBalance = originalBalance;
    const amounts = sanitizedLines.slice(1).map(line => {
        return +parseFloat(line.match(/(\d+\.\d+)/)[0]);
    });
    const computations = amounts.map(a => {
        currentBalance -= a;
        return currentBalance.toFixed(2);
    });
    const totalExpenses = amounts.reduce((result, amount) => result + amount, 0)
    const averageExpense = totalExpenses / amounts.length;
    const result = cuttedLines.map((line, index) => {
        if (index === 0) {
            return `Original Balance: ${originalBalance.toFixed(2)}`;
        } else {
            return `${line}${amounts[index-1].toFixed(2)} Balance ${computations[index -1]}`;
        }
    });
    result.push(`Total expense  ${totalExpenses.toFixed(2)}`)
    result.push(`Average expense  ${averageExpense.toFixed(2)}`)
    return result.join('\r\n');
};

var b1 = `1000.00!=

125 Market !=:125.45
126 Hardware =34.95
127 Video! 7.45
128 Book :14.32
129 Gasoline ::16.10
`
var b1sol = `Original Balance: 1000.00\r
125 Market 125.45 Balance 874.55\r
126 Hardware 34.95 Balance 839.60\r
127 Video 7.45 Balance 832.15\r
128 Book 14.32 Balance 817.83\r
129 Gasoline 16.10 Balance 801.73\r
Total expense  198.27\r
Average expense  39.65`

var b2 = `1233.00
125 Hardware;! 24.8?;
123 Flowers 93.5
127 Meat 120.90
120 Picture 34.00
124 Gasoline 11.00
123 Photos;! 71.4?;
122 Picture 93.5
132 Tyres;! 19.00,?;
129 Stamps 13.6
129 Fruits{} 17.6
129 Market;! 128.00?;
121 Gasoline;! 13.6?;`

var b2sol = `Original Balance: 1233.00\r
125 Hardware 24.80 Balance 1208.20\r
123 Flowers 93.50 Balance 1114.70\r
127 Meat 120.90 Balance 993.80\r
120 Picture 34.00 Balance 959.80\r
124 Gasoline 11.00 Balance 948.80\r
123 Photos 71.40 Balance 877.40\r
122 Picture 93.50 Balance 783.90\r
132 Tyres 19.00 Balance 764.90\r
129 Stamps 13.60 Balance 751.30\r
129 Fruits 17.60 Balance 733.70\r
129 Market 128.00 Balance 605.70\r
121 Gasoline 13.60 Balance 592.10\r
Total expense  640.90\r
Average expense  53.41`

balance(b2);