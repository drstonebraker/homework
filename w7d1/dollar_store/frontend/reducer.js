import { SWITCH_CURRENCY } from './actions';

const initialState = {
  baseCurrency: "Please select",
  rates: {}
};

const reducer = (state = initialState, {type, baseCurrency, rates}) => {
  Object.freeze(state);
  switch (type) {
    case SWITCH_CURRENCY:
      return {
        baseCurrency,
        rates
      };
    default:
      return state;
  }
};

export default reducer;
