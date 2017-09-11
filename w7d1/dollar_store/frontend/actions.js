export const SWITCH_CURRENCY = 'SWITCH_CURRENCY';

const selectCurrency = (baseCurrency, rates) => ({
  type: SWITCH_CURRENCY,
  baseCurrency,
  rates
});

export default selectCurrency;
