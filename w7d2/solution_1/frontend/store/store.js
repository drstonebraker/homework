import { createStore, applyMiddleware } from 'redux';
import RootReducer from '../reducers/root_reducer';

const addLoggingToDispatch = store => next => action => {
  const dispatch = store.dispatch;

  console.log('state: ', store.getState());
  console.log('action: ', action);
  let result = next(action);
  console.log('state: ', store.getState());
  return result;

};

const configureStore = (preloadedState = {}) => {
  const store = createStore(RootReducer, preloadedState, applyMiddleware(addLoggingToDispatch));
  store.subscribe(() => {
    localStorage.state = JSON.stringify(store.getState());
  });
  return store;
};

export default configureStore;
