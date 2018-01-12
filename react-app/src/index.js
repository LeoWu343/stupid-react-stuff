import React from 'react';
import ReactDOM from 'react-dom';
import './index.css';
import App from './App';
import { base, loadCss } from './helper';

const renderApp = (elementId) => {
  if (process.env.NODE_ENV === 'production') {
    loadCss(base + 'static/css/main.css', 'react-app-css');
  }
  ReactDOM.render(<App />, document.getElementById(elementId));
}

if (process.env.NODE_ENV !== 'production') {
  renderApp('root');
}
