type CardInfo = {
  count: number;
  index: number;
  wins: number;
};

// Take the output from `lib/day04.ex` and add it to this array
const cards: CardInfo[] = [];

cards.forEach((card) => {
  for (let i = 0; i < card.count; i++) {
    for (let j = 1; j <= card.wins; j++) {
      cards[card.index + j].count++;
    }
  }
});

console.log(
  cards.reduce((acc, card) => {
    return acc + card.count;
  }, 0)
);
