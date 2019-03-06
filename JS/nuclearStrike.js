const alphabetWar = battelfield => {
    if (isStriked(battelfield)) {
        battelfield = eliminateUnprotectedLetters(battelfield).join('');
        battelfield = eliminateUnprotectedLetters(battelfield);
        battelfield = destroyShelters(battelfield).join('');
    }
    return battelfield.replace(/\[|]/g, '');
};

const isStriked = battelfield => /#/.test(battelfield);
const eliminateUnprotectedLetters = battelfield => {
    return battelfield.match(/(#+)|(\[[a-z]+])/g);
};
const destroyShelters = battelfield => {
    return battelfield.reduce((result, e, idx) => {
        if (/\[/.test(e)) {
            if (!/#{2,}/.test(String(battelfield[idx - 1])) && 
                !/#{2,}/.test(String(battelfield[idx + 1])) &&
                !(/#/.test(String(battelfield[idx - 1])) && /#/.test(String(battelfield[idx + 1]))))
                result.push(e);
        }
        return result;
    }, [])
};

alphabetWar('[a]#b#[c][d]');