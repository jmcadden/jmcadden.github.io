---
layout: page
title: Slides 
---

<ul>
  {% for post in site.slides %}
    <li>
      <a href="{{ post.url }}">{{post.date | date_to_string }} | {{ post.title }}</a> 
    </li>
  {% endfor %}
</ul>

