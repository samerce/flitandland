import React, {useEffect} from 'react'

SlackWebhookUrl = process.env.SLACK_WEBHOOK_URL

export default =>
  postToSlack = ({detail}) =>
    {msg, channel} = detail
    window.dispatchEvent new Event('PostToSlackPending')
    fetch(SlackWebhookUrl, {
      method: 'POST',
      headers: {
        Accept: 'application/json',
      },
      body: JSON.stringify({
        text: msg,
        channel: '#' + channel,
      })
    }).then (response) =>
      if response.ok
        window.dispatchEvent new Event('PostToSlackDone')
      else
        window.dispatchEvent new CustomEvent('PostToSlackFailed', {
          detail: response.status
        })

  useEffect (=>
    window.addEventListener 'PostToSlack', postToSlack
    => window.removeEventListener 'PostToSlack', postToSlack
  ), []
  <div />
