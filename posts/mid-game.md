---
title: mid game
pubDate 2023-10-18 18:25:45
tags:
---

# Mid game

In a chess game, as soon as possible you develop your pieces to achieve the mid-game, better is for your match! At this stage of the game, the number of unknown plays starts to increase exponentially, At this exact point the players who built a good foundation, in the beginning(early-game), start to contrast, without saying that it is in this phase that it's possible to differentiate players with the [good taste](http://www.paulgraham.com/taste.html)

## Assumptions

<img src="/images/midgame1.png" alt="prs" style="width:100px;"/>


> Software is hard to change because it's complicated and permeated with > assumptions, principally when you have integrations and versioning.
>
> [Martin Nally - Designing Quality APIs (Cloud Next '18)
> ](https://www.youtube.com/watch?v=P0a7PwRNLVU)


I really think that software development could be compared with a chess game, in truth, I'm always asking myself, which are the core plays, that I as an engineer could follow to guarantee that the mid-game of my projects will be successful. Because the only certainty that I have is that in this phase I will have more premises than concrete and determinist certain

What I want to tease here, are the lacks in languages that are widely used to build distributed system. I'm not a mage 🧙🏾‍♂️ of the software development, but for me, it's possible to perceive these lacks and also weave options on top of it!

## Side effect

<img src="/images/midgame0.png" alt="prs" style="width:100px;"/>

This is completely odd to me, depending on the order in which you call your functions, this can change the variable state that you don't even know and that is extremely important for the behavior of your service, and debug that can make you lose good sleep days.

But yep, you can say: "you can't blame a language for a developer's failure!" And I think that you're probably right.

But at least for me, I think that I will always commit a foolish error and if the language has the mechanisms to avoid this, better, let's avoid future problems


## Other era, other principles

<img src="/images/midgame2.png" alt="prs" style="width:100px;"/>


> Programs don’t run in a single computer anymore. They run in lots of  computers that are all interacting, all communicating. So it’s not about computation anymore, so much as it’s about communication. And we need languages which are built to solve the problems in that paradigm.
>
> [Embrace new paradigms - Douglas Crockford](https://corecursive.com/json-vs-xml-douglas-crockford/#embrace-new-paradigms)

When you have a limited time to embrace new problems and product challenges, I really think that you need to be very strict in the tools that you are using, because this will reflect in the way that new guys will build on top of your code base and obviously the way that you need to circumvent the architecture design to make these languages that weren't built to run in distributed environment had a good performance.


## Threads and locks

<img src="/images/midgame3.png" alt="prs" style="width:100px;"/>

> Threads-and-locks programming is like a Ford Model T. It will get you from point A to point B, but it is primitive, difficult to drive, and both unreliable and dangerous compared to newer technology
>
> Paul Butcher - Seven Concurrency models in seven weeks


Don't know if this should be wrote with big letters in the home page of the languages that use thread-and-locks as your principal model of parallelism. But the fact is, it's hard to deal in a pragmatic way with this type of model. I'm always have the sensations that I'm working for the language not the opposite.


## Serverless

<img src="/images/midgame4.png" alt="prs" style="width:100px;"/>


Serverless is pure gold, you need to know just basic things to start to ship code to production, but for me, behind each abstraction exists lacks, and in this specific case, it's related to the way your program will run, that is a little bit different for the way that you run in your own machine, and for this reason, it's also hard to see parallelism deficiency when you are using this approach.

Basically, the absence of performance of the language is solved using more hardware because it's cheaper and easier than wonder or embraces "lower level abstractions".

But I need to point out, that I'm talking about software-driven solutions/products, each language will solve a specific issue, but as said before, I could perceive that there exists a level of inadequacy in languages that weren't built to run in distributed environments

## Tests, metrics & structured logs

<img src="/images/midgame5.png" alt="prs" style="width:100px;"/>

This is related to the early-stage game that I mentioned at the beginning of the essay, should be the core of any project that will run in a cloud environment, but what bores me, is that I've already played around with some open-source projects and also professional projects, but was hard to see that!

This could be for a lot of things, but for me, I think that is related to the mental model that languages like Python, Ruby, and JavaScript, were built on top. I'm not trying to argue that they are poor languages, or you don't use them, just saying that it's a completely different  conceptual model and maybe, for this reason, they don't fit for the future of the software development
