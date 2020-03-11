/**
 * app.js
 *
 * This is the entry file for the application, only setup and boilerplate
 * code.
 */

// Needed for redux-saga es6 generator support
import '@babel/polyfill';

import React from 'react';
import ReactDOM from 'react-dom';
import 'sanitize.css/sanitize.css';
import './utils/lang'
import {isInsider} from './utils/nav'

// third party global imports
import '../node_modules/react-image-gallery/styles/css/image-gallery-no-icon.css'

import App from 'containers/App';

// Load the favicon and the .htaccess file
/* eslint-disable import/no-unresolved, import/extensions */
import '!file-loader?name=[name].[ext]!./images/favicon.ico';
import 'file-loader?name=.htaccess!./.htaccess';
/* eslint-enable import/no-unresolved, import/extensions */

const MOUNT_NODE = document.getElementById('app');

const render = () => {
  ReactDOM.render(
    <App />,
    MOUNT_NODE,
  );
};

if (module.hot) {
  // Hot reloadable React components and translation json files
  // modules.hot.accept does not accept dynamic dependencies,
  // have to be constants at compile-time
  module.hot.accept(['containers/App'], () => {
    ReactDOM.unmountComponentAtNode(MOUNT_NODE);
    render();
  });
}

render();

// Install ServiceWorker and AppCache in the end since
// it's not most important operation and if main code fails,
// we do not want it installed
if (process.env.NODE_ENV === 'production') {
  require('offline-plugin/runtime').install(); // eslint-disable-line global-require
}

if (process.env.NODE_ENV === 'production' && !isInsider()) {
  upon('analyticsReady', () => {
    ga('create', 'UA-104536966-1', 'auto')
    ga('send', 'pageview')
    ga.sendEvent = (eventCategory, eventAction, eventLabel) => {
      ga('send', 'event', {eventCategory, eventAction, eventLabel})
    }
  })
} else {
  // disable analytics for development
  window.ga = () => {}
  // disable hotjar for development
  window.hj = () => {}
}
