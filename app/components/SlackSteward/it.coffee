import React from 'react'

import useBus from '../../hooks/useBus.coffee'

export default =>
  useBus
    PostToSlack: ({msg, channel}) =>
      cast 'PostToSlackPending'
      fetch(process.env.SLACK_WEBHOOK_URL, {
        method: 'POST'
        headers:
          Accept: 'application/json'
        body: JSON.stringify({
          text: msg
          channel: '#' + channel
        })
      }).then (response) =>
        if response.ok then cast 'PostToSlackDone'
        else cast 'PostToSlackFailed', response.status
  <div />
