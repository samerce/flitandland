/*
 * HomePage
 *
 * This is the first thing users see of our App, at the '/' route
 *
 */

import React from 'react';

export default function HomePage() {
  return (
    <h1>
      <FormattedMessage {...messages.header} />
    </h1>
  );
}