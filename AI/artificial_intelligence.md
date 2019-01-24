## Artificial Intelligence

### Q-Learning Intuition

#### Reinforcement Learning
* With reinforcement learning, we don't have to hard code the learning process. Given the environment (e.g. maze) and the reward, the AI should be able to figure the way to reach the goal by itself.

#### Bellman Equation
* The basic version is V(s) = max(R(s, a) + r * V(s')). In this equation, V() measures the highest value we can get for all the possible actions 'a' we can take at status 's'. R() measures the instant reward we can get if we take action 'a' at status 's'. And 's'' represents the next status, 'r' is a constant.

#### Markov Decision Process (MDP)
* Mathematical framework for modeling the decision making where outcome is partly random and partly under control of decision maker.
* This framework makes our Bellman Equation more sophisticated: r * V(s') becomes sum of (r * P(s, a, si') * V(si')), P() is the probability and si represents the possible next status.
* More reading material: [A Survey of Applications of Markov Decision Processes](http://www.cs.uml.edu/ecg/uploads/AIfall14/MDPApplications3.pdf)

#### Policy vs Plan
* Plan means the absolute actions we will take for each status.
* When our next status is not completely controlled (partly random), then the policy might be different because AI can calculated some optimized approach that is different from our expectations.  

#### Living Penalty
* If living in the game also has a cost, then the policies of AI might be changed based on how big the penalty is. For [example](https://i.ytimg.com/vi/txEJgSSo3VA/maxresdefault.jpg), if the cost of living is even bigger than the reward of the game, AI will just try everything possible to finish the game regardless of getting reward or not.

#### Q-Learning
* Basically V(s) we had before represents the best value we can get across each action 'a'. Now we define Q(s, a) as the value we can get from taking that specific action 'a'. In general, V(s) = max(Q(s, a)). We can use this equation to re-write our bellman equation as Q(s, a) = R(s, a) + sum(r * P(s, a, s') * max(Q(s', a')))
* We defined temporary difference as the difference between the Q(s, a) before we take action and the true quality after the action, which is R(s, a) + sum(r * P(s, a, s') * max(Q(s', a'))). And we [optimize](https://cdn-images-1.medium.com/max/2000/1*LLfj11fivpkKZkwQ8uPi3A.png) the Q function by multiple the difference with a learning rate.
