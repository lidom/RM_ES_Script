# Estimation Theory


## Bias, Variance and MSE


Given a sample $X_1,\dots,X_n$ consider an estimator $\widehat{\theta}_n\equiv\widehat{\theta}(X_1,\dots,X_n)$ of a real-valued parameter  $\theta\in\Omega\subset\mathbb{R}$.

The distribution of any estimator of course depends on the true parameter vector $\theta$, i.e., more precisely, $$\widehat{\theta}_n\equiv \widehat{\theta}(X_1,\dots,X_n;\theta).$$ 
This dependence is usually not explicitly written, but all properties of estimators discussed below have to hold for all possible parameter values $\theta\in\Omega$. This will go without saying.

\

Statistical inference requires to assess the accuracy of an estimator.


\


The **bias** of an estimator is defined by
$$\textrm{Bias}(\widehat{\theta}_n)=E(\widehat{\theta}_n)-\theta$$
An estimator is called **unbiased** if $E(\widehat{\theta}_n)=\theta$ and hence $\textrm{Bias}(\widehat{\theta}_n)=0$ (for all possible $\theta\in\Omega$).


\

The **variance** of an estimator is given by
$$\textrm{var}(\widehat{\theta}_n)=E\left((\widehat{\theta}_n-E(\widehat{\theta}_n))^2\right).$$


\


Performance of an estimator is most frequently evaluated with respect to the **quadratic loss** (also
called $L_2$ loss)
$$(\widehat{\theta}_n-\theta)^2.$$ 
The corresponding risk is the **Mean Squared Error (MSE)**
$$E\left((\widehat{\theta}_n-\theta)^2\right)=\textrm{Bias}(\widehat{\theta}_n)^2+\textrm{var}(\widehat{\theta}_n)$$
For an unbiased estimator the mean squared error is obviously equal to the variance of the estimator.


\


**Example:** Assume an i.i.d. sample $X_1,\dots,X_n$ with mean $\mu=E(X_i)$ and variance $\sigma^2=\textrm{var}(X_i)<\infty$.

* The sample mean $\bar X$ is an unbiased estimator of the true mean $\mu$, since the equation
$$E(\bar X)=\mu$$
holds for any possible value of the true mean $\mu$.
* The variance of the estimator $\bar X$ is given by
$$\textrm{var}(\bar X)=\sigma^2/n$$
* The mean squared error of the estimator $\bar X$ is given by
$$E\left((\bar X-\mu)^2\right)=\textrm{var}(\bar X)=\sigma^2/n$$



## Consistency of Estimators

Asymptotic theory is concerned with theoretical results valid for "large sample sizes". Important keywords of asymptotic theory are: 

* consistency
* rates of convergence
* asymptotic distributions 


They all rely on elaborated concepts on the stochastic convergence of random variables.


\



**Stochastic convergence.** 
Let $\{Z_n\}_{n=1,2,3,\dots}$ be a sequence of **random variables**. Mathematically, there are different kinds of convergence of
$\{Z_n\}$ to a fixed value $c$. The three most important are:

* Convergence in probability (abbreviated $Z_n\to_P c$):
$$\lim_{n\to\infty} P\left(|Z_n-c|>\epsilon\right)=0\quad\hbox{ for all }\quad\epsilon>0$$
* Almost sure convergence (abbreviated $Z_n\to_{a.s.} c$):
$$P\left(\lim_{n\to\infty} Z_n=c\right)=1$$
* Convergence in quadratic mean (abbreviated $Z_n\to_{q.m.} c$):
$$\lim_{n\to\infty} E\left((Z_n-c)^2\right)=0$$


Note that:

* $Z_n\to_{a.s.} c$ implies $Z_n\to_P c$
* $Z_n\to_{q.m.} c$ implies $Z_n\to_P c$


\

**Consistency of estimators.** Based on a sample $X_1,\dots,X_n$ let $\hat\theta_n\equiv\theta_n(X_1,\dots,X_n)$ be an estimator of an unknown parameter $\theta$.

* $\hat\theta_n$ is called "weakly consistent" if
$$\hat{\theta}_n\to_{P} \theta\quad \hbox{ as }\quad n\to\infty $$
* $\hat\theta_n$ is called "strongly consistent" if
$$\hat{\theta}_n\to_{a.s.} \theta\quad \hbox{ as }\quad n\to\infty $$

\

**Remark:** For most statistical estimation problems it is usually possible to define many different estimators. The real problem is to find a good estimator which approximates the true parameter $\theta$ with the maximal possible accuracy. Consistency is generally seen as a necessary condition which has to be satisfied by any reasonable estimator. In econometric practice usually only weak consistency is derived which generally follows from weak [**laws of large numbers**](https://www.statlect.com/asymptotic-theory/law-of-large-numbers).

\


**Example:** Assume again an i.i.d. sample $X_1,\dots,X_n$ with mean $\mu=E(X_i)$ and variance $\sigma^2=\textrm{var}(X_i)<\infty$. As stated above we then have
$$E\left((\bar X-\mu)^2\right)=\textrm{var}(\bar X)=\sigma^2/n\rightarrow 0 \quad \text{as } n\rightarrow\infty.$$
Therefore, $\bar X \to_{q.m.} \mu$. The latter implies that $\bar X \to_{P} \mu$, i.e. $\bar X$ is a (weakly) consistent estimator of $\mu$.





## Rates of Convergence

Rates of convergence quantify the (stochastic) order of magnitude of an estimation error in dependence of the
sample size $n$. This order of magnitude is usually represented using the symbols: $O_P$ and $o_P$.

\

Let $\{Z_n\}_{n=1,2,3,\dots}$ be a sequence of random variables, and let $\{c_n\}_{n=1,2,3,\dots}$ be a sequence of positive numbers ($c_n$ may de a deterministic sequence of real numbers or it may be a sequence of random variables).

* We will write $Z_n=O_p(c_n)$ if for any $\epsilon>0$ there exist numbers $0<M<\infty$ and $m$ such that
$$P(|Z_n|\ge M\cdot c_n)\leq\epsilon\quad\hbox{ for all }\quad n\geq m.$$
* We will write $Z_n=o_p(c_n)$ if
$$\lim_{n\to\infty} P(|Z_n|\geq\epsilon\cdot c_n)=0\quad\hbox{ for all }\quad \epsilon>0.$$
* With $c_n=1$ for all $n$, $Z_n=O_p(1)$ means that the sequence $\{Z_n\}$ is **stochastically bounded**. I.e., for any $\epsilon>0$ there exist number $0<M<\infty$ and $m$ such that 
$$P(|Z_n|\geq M)\leq\epsilon\quad\hbox{ for all }\quad n\geq m.$$
* With $c_n=1$ for all $n$, $Z_n=o_P(1)$ is equivalent to $Z_n\to_{P} 0$, i.e., $Z_n$ **converges in probability to zero**.


Note that:

* $Z_n=O_p(c_n)$ is equivalent to $Z_n/c_n=O_p(1)$
* $Z_n=o_p(c_n)$ is equivalent to $Z_n/c_n=o_p(1)$


\

**Definition:** An estimator $\hat\theta\equiv\hat\theta_n$ of a parameter $\theta$ possesses the
**rate of convergence** $n^{-r}$ if and only if $r$ is the *largest positive number* with the property that
$$|\hat\theta_n-\theta|=O_P(n^{-r}).$$

The rate of convergence quantifies how fast the estimation error decreases when increasing the sample size $n$.


\


**Unbiased estimators:** Let $\hat\theta_n$ be an *unbiased* estimator of an unknown parameter $\theta$ satisfying $\textrm{var}(\hat\theta_n)=C n^{-1}$ for some $0<C<\infty$. Then $\hat\theta_n$ possesses the rate of convergence $n^{-1/2}$. This is a consequence of the [Chebyshev inequality](https://www.statlect.com/fundamentals-of-probability/Chebyshev-inequality).

\

**Chebyshev inequality:** If $Z$ denotes a random variable with mean $\mu$ and variance $\sigma^2$, then
$$P\left(|X-\mu|> \sigma \cdot m\right)\le \frac{1}{m^2}\quad\hbox{ for all }\quad m>0$$
$$\Rightarrow
P\left(|\hat\theta_n-\theta|> n^{-1/2}\sqrt{C} \cdot
\frac{1}{\sqrt{\epsilon}}\right)\leq \epsilon \quad\hbox{ for all }\quad\epsilon>0$$


\


**Generalization:** Let $\hat\theta_n$ be a *not necessarily unbiased* estimator of an unknown parameter $\theta$. If $E\left((\hat\theta_n-\theta)^2\right)=Cn^{-2r}$ for some $0<C<\infty$, then $|\hat\theta_n-\theta|=O_P(n^{-r})$ and $n^{-r}$ is the rate of convergence of $\hat\theta_n$.


\


**Example:** Assume an i.i.d. sample $X_1,\dots,X_n$ with mean $\mu=E(X_i)$ and variance $\sigma^2=\textrm{var}(X_i)<\infty$. The sample mean $\bar X$ ($\equiv \bar X_n$) is an unbiased estimator of $\mu$ with variance $\textrm{var}(\bar X)=\sigma^2/n$.
For large $n$ we have by the central limit theorem that approximately $\sqrt{n}(\bar X-\mu)\sim N(0,\sigma^2)$. Therefore, for example:

* with $\epsilon=0.05$ we obtain
$$P\left(|\bar X_n-\mu|\ge 1.96\sigma\cdot n^{-1/2}\right)=0.05$$
* with $\epsilon=0.01$ we obtain
$$P\left(|\bar X_n-\mu|\ge 2.64\sigma\cdot n^{-1/2}\right)=0.01.$$


Generalizing this argument for all possible $\epsilon>0$ we can conclude that
$\bar X-\mu=O_P(n^{-1/2})$. On the other hand for any $r>1/2$ we have $n^{-r}/n^{-1/2}\rightarrow 0$ as $n\rightarrow \infty$. Hence, for any constant $c>0$

\begin{align*}
 &P\left(|\bar X_n-\mu|\geq c\sigma\cdot n^{-r}\right)=\\
=&P\left(|\bar X_n-\mu|\ge (c\sigma\cdot n^{-1/2})\cdot\frac{n^{-r}}{n^{-1/2}}\right)\rightarrow 1 \quad\text{as}\quad n\rightarrow \infty.
\end{align*}

Therefore $n^{-1/2}$ is the **rate of convergence** of $\bar X$.


\


Note that:

* Maximum-likelihood estimators of an unknown parameter  usually possess the rate of convergence $n^{-1/2}$ (there are exceptions!).
* The situation is different, for instance, in nonparametric curve estimation problems. For example kernel estimators (of a density or regression function) only achieve the rate of convergence $n^{-2/5}$.
* The rate of convergence is an important criterion for selecting the best possible estimator for a given problem. For most parametric problems it is well known that the optimal (i.e. fastest possible) convergence rate is $n^{-1/2}$. In nonparametric regression or density estimation the optimal convergence rate is only $n^{-2/5}$, if the underlying function is twice continuously differentiable.


\


$O_P$-rules:

* We have 
$$Z_n\rightarrow_P Z \qquad \text{if and only if }\qquad Z_n=Z+o_p(1)$$
This follows from $Z_n=Z+(Z_n-Z)$ and $Z_n-Z\rightarrow_P 0$.

\


* If $Z_n=O_P(n^{-\delta})$ for some $\delta>0$, then $Z_n=o_P(1)$

\


* If $Z_n=O_P(r_n)$, then $Z_n^\delta=O_P(r_n^\delta)$ for any $\delta>0$. Similarly,
$Z_n=o_P(r_n)$ implies $Z_n^\delta=o_P(r_n^\delta)$ for any $\delta>0$.

\


* If $Z_n=O_P(r_n)$ and $V_n=O_P(s_n)$, then
\begin{align*}
Z_n+V_n & =O_P(\max\{r_n,s_n\})\\
Z_nV_n &  =O_P(r_ns_n)
\end{align*}

\


* If $Z_n=o_P(r_n)$ and $V_n=O_P(s_n)$, then $Z_nV_n=o_P(r_n s_n)$

\


* If $E(|Z_n|^k)=O(r_n)$, then $Z_n=O_p(|r_n|^{1/k})$ for $k=1,2,3,\dots$





## Asymptotic Distributions

The practically most important version of stochastic convergence is convergence in distribution. Knowledge about the "asymptotic distribution" of an estimator allows to construct confidence intervals and tests.

\

**Definition:** Let $Z_n$ be a sequence of random variables with corresponding distribution functions $G_n$. Then $Z_n$ **converges in distribution** to a random variable $Z$ with distribution function $G$, if
$$G_n(x)\to G(x)\quad\hbox{ as }\quad n\to\infty $$
at all continuity points $x$ of $G$ (abbreviated: $Z_n\to_L Z$ or $Z_n\to_L G$ or "$\to_D$" instead of "$\to_L$").


\


In a vast majority of practically important situation the limiting distribution is the normal distribution. One then speaks of **asymptotic normality**. Asymptotic normality is usually a consequence of [central limit theorems](https://www.statlect.com/asymptotic-theory/central-limit-theorem]). The simplest result in this direction is the central limit theorem of Lindeberg-Levy.


\

**Theorem (Lindeberg-Levy)** Let $Z_1,Z_2,\dots$ be a sequence of i.i.d. random variables with
finite mean $\mu$ and variance $\sigma^2<\infty$. Then
$$\sqrt{n}\left(\frac{1}{n} \sum_{i=1}^n Z_i -\mu\right)\rightarrow_L N(0,\sigma^2).$$

\

**Example:** Let $X_1,\dots,X_n$ be independent random variables
with $E(X_i)=\mu$, $Var(X_i)=\sigma^2$. Then the  central limit theorem of Lindeberg-Levy implies that
$$\sqrt{n}(\bar X -\mu ) \to_L N(0,\sigma^2)\quad\text{ or equivalently }\quad
\frac{\sqrt{n}(\bar X -\mu )}{\sigma}\to_L N(0,1).$$
We can conclude that $\bar X$ is an "asymptotically  normal estimator" of $\mu$. If $n$ is sufficiently large, then  $\bar X$ is approximatively normal with mean $\mu$ and variance $\sigma^2/n$. Frequently used notations:

* $\bar X\sim AN(\mu,\sigma^2/n)$
* $\bar X\overset{a}{\sim}N(\mu,\sigma^2/n)$


\

Most estimators $\hat\theta_n$ used in parametric and nonparametric statistics are asymptotically normal. In parametric problems (with rate of convergence $n^{-1/2}$) one usually obtains
$$\sqrt{n}(\hat\theta_n -\theta )\to_L N(0,v^2),$$
where $v^2$ is the asymptotic variance of the estimator (often, but not necessarily,  $v^2=\lim_{n\to\infty} n\cdot\textrm{var}(\hat\theta_n)$).

<!-- $$\Rightarrow \hat\theta_n\sim AN(\theta,v^2/n)$$ -->


\


**Multivariate generalization:** The above concepts are easily generalized to estimators $\hat\theta_n$ of a multivariate parameter vector $\theta\in\mathbb{R}^p$. Consistency and rates of convergence then have to be derived separately for each element of the vector. Convergence in distribution is defined via convergence of the multivariate distribution functions. For standard estimators (e.g., maximum likelihood) in parametric problems one usually obtains
$$\sqrt{n}(\hat\theta_n -\theta )\to_L N_p(0,V),$$
where $V$ is the asymptotic covariance matrix (usually, $V=\lim_{n\to\infty} n\cdot\textrm{Cov}(\hat\theta_n)$).


\


Multivariate normality holds if and only if for any vector $c=(c_1,\dots,c_p)'\in\mathbb{R}^p$ with $\sum_{j=1}^p c_j^2=\Vert c\Vert_2^2=1$
$$\sqrt{n}\left(\sum_{j=1}^p c_j (\hat\theta_{jn} -\theta_j)\right)=\sqrt{n}\left(c'\hat\theta_n-c'\theta\right)\to_L N\left(0,v_c^2\right),$$
where
$$v_c^2=c'Vc=\sum_{j=1}^p\sum_{k=1}^p c_jc_k V_{jk},$$
and where $V_{jk}$ are the elements of the asymptotic covariance matrix $V$. 


This condition is frequently called **"Cramer-Wold device"**. Using one-dimensional central limit theorems it can be verified for any vector $c$.


\


**Example:** Let $X_1=(X_{11},X_{12})',\dots,X_n=(X_{n1},X_{n2})'$ be i.i.d. two-dimensional random vectors with $E(X_i)=\mu=(\mu_1,\mu_2)'$ and $Cov(X_i)=\Sigma$. The Cramer-Wold device and Lindeberg-Levy's central limit theorem then imply that
$$\sqrt{n}\left(\bar X -\mu\right)\to_L N_2\left(0,\Sigma\right).$$


\

Note that asymptotic normality usually also holds for nonparametric curve estimators with convergence rates slower than $n^{-1/2}$.




## Asymptotic Theory

Many estimation procedures in modern statistics rely on fairly general assumptions. For a given sample size $n$ it is then often impossible to derive the exact distribution of $\theta_n$. Necessary calculations are too complex, and finite sample distributions usually depend on unknown characteristics of the distribution of the underlying data.


\

The goal of asymptotic theory then is to derive reasonable approximations. For **large samples** such approximations are of course very accurate, for **small samples** there may exist a considerable approximation error. Therefore, for small samples the approximation quality of asymptotic approximations is usually studied by Monte-Carlo approximations.

\

Asymptotic theory is used in order to select an appropriate estimation procedure in complex situations. The idea is to determine the estimator which, at least for large sample sizes, provides the smallest possible estimation error. This leads to the concept of "asymptotically efficient" estimators.


\


Properties of an asymptotically efficient estimator $\theta_n$:

* For the estimation problem to be considered $\theta_n$ is consistent and adopts the fastest possible rate of convergence
(generally:$n^{-1/2}$ in  parametric statistics, $n^{-2/5}$ in nonparametric curve estimation problems).
* In most regular situations one is additionally interest in a "best asymptotically normal" (BAN) estimator.  Assume that $\sqrt{n}(\theta_n -\theta)\sim N(0,v^2)$. Then $\theta_n$ is a BAN-estimator if any alternative estimator $\tilde\theta_n$ with
$\sqrt{n}(\tilde\theta_n -\theta)\sim N(0,\tilde v^2)$ possesses a larger asymptotic variance, i.e. $\tilde v^2\geq v^2$.
* **Multivariate generalization:** An estimator $\theta_n$ with  $\sqrt{n}(\theta_n -\theta)\sim N_p(0,V)$ is best asymptotically normal if
$$c'\tilde V c\geq c'Vc\quad\hbox{ for all }\quad c\in\mathbb{R}^p, \Vert c\Vert_2^2=1$$
for any other estimator $\tilde\theta_n$ satisfying $\sqrt{n}(\tilde\theta_n -\theta)\sim N_p(0,\tilde V)$.

\

For most estimation problems in parametric statistics maximum-likelihood estimators are best asymptotically normal.



## Mathematical tools

### Taylor expansions


Taylors' theorem: Let $f$ be a real-valued function which is
$k+1$ continuously differentiable in the interior of an interval $[a,b]$. Consider a point
$x_0\in (a,b)$. For any other value $x\in (a,b)$ there exists some $\psi\in [x_0,x]$ such that
$$f(x)=f(x_0)+\sum_{r=1}^k \frac{1}{r!}f^{(r)}(x_0)\cdot(x-x_0)^r+\frac{1}{(k+1)!}f^{(k+1)}(\psi)\cdot(x-x_0)^{k+1}$$
\


Qualitative version of Taylors' formula:
$$f(x)=f(x_0)+\sum_{r=1}^k \frac{1}{r!}f^{(r)}(x_0)\cdot(x-x_0)^r+O((x-x_0)^{k+1})$$

\


**Example:**  Let $f(x)=ln(x)$ und $x_0=1$ $\Rightarrow$ $f'(x_0)=1$, $f''(x_0)=-1$.

\


First order Taylor approximation: $f(x)=\tilde f(x)+O((x-x_0)^{2})$, where $\tilde f(x)=x-x_0$

* $x=1.05$ $\Rightarrow$ $f(x)=0.04879$, $\tilde f(x)=0.05$ and $|f(x)-\tilde f(x)|=0.00121$
* $x=1.1\phantom{0}$ $\Rightarrow$ $f(x)=0.09531$, $\tilde f(x)=0.1\phantom{0}$ and $|f(x)-\tilde f(x)|=0.00469$
* $x=1.5\phantom{0}$ $\Rightarrow$ $f(x)=0.40546$, $\tilde f(x)=0.5\phantom{0}$ and $|f(x)-\tilde f(x)|=0.09454$
* $x=2\phantom{.00}$ $\Rightarrow$ $f(x)=0.69315$, $\tilde f(x)=1\phantom{.00}$ and $|f(x)-\tilde f(x)|=0.30685$


\


Second order Taylor approximation: $f(x)=\tilde f(x)+O((x-x_0)^{3})$, where $\tilde f(x)=x-x_0-\frac{1}{2} (x-x_0)^2$

* $x=1.05$ $\Rightarrow$ $f(x)=0.04879$, $\tilde f(x)=0.04875$ and $|f(x)-\tilde f(x)|=0.00004$
* $x=1.1\phantom{0}$ $\Rightarrow$ $f(x)=0.09531$, $\tilde f(x)=0.95\phantom{000}$ and $|f(x)-\tilde f(x)|=0.00031$
* $x=1.5\phantom{0}$ $\Rightarrow$ $f(x)=0.40546$, $\tilde f(x)=0.375\phantom{00}$ and $|f(x)-\tilde f(x)|=0.03046$
* $x=2\phantom{.00}$ $\Rightarrow$ $f(x)=0.69315$, $\tilde f(x)=0.5\phantom{0000}$ and $|f(x)-\tilde f(x)|=0.19315$


\



**Multivariate generalization:** $x_0,x\in\mathbb{R}^p$, $f'(x_0)\in\mathbb{R}^p$, $f''(x_0)$ a $p\times p$ Matrix.


First order Taylor approximation:
$$f(x)=f(x_0)+f'(x_0)\cdot(x-x_0)+O(\Vert x-x_0\Vert_2^2)$$


Second order Taylor approximation:
$$f(x)=f(x_0)+f'(x_0)\cdot(x-x_0)+\frac{1}{2} (x-x_0)^T f''(x_0)(x-x_0)+O(\Vert x-x_0\Vert_2^3)$$




### Tools for deriving asymptotic distributions

Let $\{W_n\}$, $\{Z_n\}$  be sequences of random variables, then:

* $Z_n=W_n+o_P(1)\quad \Leftrightarrow \quad Z_n-W_n\to_P 0$. If additionally $W_n\to_L N(0,v^2)$ then $Z_n\to_L N(0,v^2)$.
* For any fixed constant  $c\neq 0$: If  $Z_n\to_P c$ and $W_n\to_L N(0,v^2)$, then
$$cW_n\to_L N(0,c^2v^2)\quad\hbox{as well as }\quad  V_n:=Z_n\cdot W_n\to_L N(0,c^2v^2).$$
Furthermore, If $Z_n$ and $c$ are positive (with probability 1) then also
$$W_n/c\to_L N(0,v^2/c^2)\quad\hbox{as well as }\quad  V_n:= W_n/Z_n\to_L N(0,v^2/c^2).$$
* Multivariate generalization ($C$, $Z_n$ $p\times p$ matrices; $W_n$ $p$-dimensional random vectors):
If $Z_n\to_P C$ as well as $W_n\to_L N_p(0,V)$, then
\begin{align*}
CW_n&\to_L N_p(0,CVC')\quad\hbox{as well as }\\
V_n:=Z_n\cdot W_n&\to_L N_p(0,CVC')
\end{align*}


<!-- For any fixed constant  $c\neq 0$: $W_n\to_L N(0,v^2)$ implies $cW_n\to_L N(0,c^2v^2)$ -->


### The Delta-Method

A further tool which is frequently used in asymptotic statistics is the so-called delta-method.


**Delta-Method:** Let $\widehat{\theta}_n$ be a sequence of estimators of a one-dimensional parameter $\theta$ satisfying
$n^{r} (\widehat{\theta}_n-\theta)\rightarrow_L  N(0,v^2),$ and let $g(.)$ be a real-valued function which is continuously differentiable at $\theta$ and satisfies $g'(\theta)\neq 0$. Then
$$n^{r} \left(g(\widehat{\theta}_n)-g(\theta)\right) \rightarrow_L  N\left(0,g'(\theta)^2v^2\right).$$

\


**Example:** Assume an i.i.d. sample $X_1,\dots,X_n$ from an exponential distribution, i.e., the underlying density of $X_i$ is given by $f(x|\theta)=\theta\exp(-\theta x)$. We then have $\mu:=E(X_i)=1/\theta$ as well as $\sigma^2_X:=\textrm{var}(X_i)=1/\theta^2$. The underlying parameter $\theta>0$ is unknown and has to be estimated from the data.


\

The maximum-likelihood estimator of $\theta$ is $\hat\theta=1/\bar X$. 


\

We know that $\sqrt{n}(\bar X-\frac{1}{\theta})\to_L N(0,\frac{1}{\theta^2})$, but what's about the distribution of $1/\bar X$? For this purpose the delta-method can be applied with $g(x)=1/x$. Then $g'(x)=-1/x^2$, $g'(1/\theta)=-\theta^2$, and consequently
$$n^{1/2} \left(\frac{1}{\bar X}-\theta\right)=n^{1/2}\left(g\left(\bar X\right)-g\left(\frac{1}{\theta}\right)\right)\rightarrow_L N\left(0,\theta^2\right).$$
 
 
 
<!-- ## Example: Simple Linear Regression -->

<!-- Assume an i.i.d. sample $(Y_1,X_1),\dots,(Y_n,X_n)$ of random variables, and consider estimating the slope parameters in the linear regression model -->
<!-- $$Y_i=\alpha+\beta X_i+\epsilon_i,\quad, i=1,\dots,n,$$ -->
<!-- where $\epsilon_i$ are i.i.d. zero mean error terms with variance $\sigma_\epsilon^2$ (independent of $X_i$). Furthermore assume that $\textrm{var}(X_i)=\sigma_X^2$. -->


<!-- \ -->


<!-- Observe that  -->
<!-- \begin{align*} -->
<!-- (Y_i-\bar{Y})&=\beta (X_i - \bar{X}) + (\epsilon_i - \bar{\epsilon}) -->
<!-- \end{align*} -->


<!-- \ -->


<!-- The least-squares estimator $\hat\beta$ of $\beta$ is given by -->
<!-- \begin{align*} -->
<!-- \hat\beta -->
<!-- &=\frac{\sum_{i=1}^n (X_i-\bar X)Y_i}{\sum_{i=1}^n (X_i-\bar X)^2}\\ -->
<!-- &=\beta+\frac{\sum_{i=1}^n (X_i-\bar X)(\epsilon_i-\bar\epsilon)}{\sum_{i=1}^n (X_i-\bar X)^2}\\ -->
<!-- &=\beta+\frac{\sum_{i=1}^n (X_i-\bar X)\epsilon_i}{\sum_{i=1}^n (X_i-\bar X)^2} -->
<!--        -\frac{\sum_{i=1}^n (X_i-\bar X)\bar\epsilon}{\sum_{i=1}^n (X_i-\bar X)^2} -->
<!-- \end{align*} -->

<!-- \ -->


<!-- We already know that $\bar X -\mu_x=O_P(n^{-1/2})$, where $\mu_x=E(X_i)$ is the mean of $X_i$. Also note that the mean of $\epsilon_i$ is zero, and hence $\bar \epsilon=O_P(n^{-1/2})$. Therefore, $(\bar X -\mu_x)\bar\epsilon=O_P(n^{-1})$. -->

<!-- \ -->


<!-- Furthermore, it follows from the law of large numbers that -->
<!-- $$\frac{1}{n}\sum_{i=1}^n (X_i-\bar X)^2 \to_P \sigma_x^2.$$ -->

<!-- \ -->


<!-- Now, -->
<!-- $$\hat\beta-\beta = -->
<!-- \frac{\frac{1}{n}\sum_{i=1}^n (X_i-\bar X)\epsilon_i}{\frac{1}{n}\sum_{i=1}^n (X_i-\bar X)^2} -->
<!-- =\frac{\frac{1}{n}\sum_{i=1}^n (X_i-\mu)\epsilon_i}{\frac{1}{n}\sum_{i=1}^n (X_i-\bar X)^2} -->
<!-- +\underbrace{\frac{ (\mu-\bar X)\bar\epsilon}{\frac{1}{n}\sum_{i=1}^n (X_i-\bar X)^2}}_{O_P(n^{-1})}$$ -->

<!-- \ -->


<!-- This implies that -->
<!-- $$\sqrt{n}(\hat\beta-\beta)  -->
<!-- =\frac{\sqrt{n}\frac{1}{n}\sum_{i=1}^n (X_i-\mu)\epsilon_i}{\frac{1}{n}\sum_{i=1}^n (X_i-\bar X)^2} -->
<!-- +\underbrace{\frac{\sqrt{n} (\mu-\bar X)\bar\epsilon}{\frac{1}{n}\sum_{i=1}^n (X_i-\bar X)^2}}_{o_P(1)}$$ -->

<!-- \ -->


<!-- By the above rules one can neglect the additional term of order $o_P(1)$ when deriving the asymptotic distribution. Note that $(X_i-\mu)\epsilon_i$ are i.i.d. random variables with zero mean and variance $\sigma_X^2\sigma_\epsilon^2$. The central limit theorem of Lindeberg-Levy thus implies that -->
<!-- $$\sqrt{n}\frac{1}{n}\sum_{i=1}^n (X_i-\mu)\epsilon_i\to_L N(0,\sigma_x^2\sigma_\epsilon^2).$$ -->

<!-- \ -->


<!-- Since $\frac{1}{n}\sum_{i=1}^n (X_i-\bar X)^2 \to_P \sigma_x^2$ we can conclude by the above rules that -->
<!-- $$\sqrt{n}(\hat\beta-\beta) \to_L N(0,\frac{\sigma_\epsilon^2}{\sigma_X^2}).$$ -->




























<!-- \subsection{ Asymptotic theory of  maximum-likelihood estimators} -->
<!-- \bigbreak\noindent -->
<!-- We only consider the simplest situation: Assume an i.i.d. sample $X_1,\dots,X_n$, and suppose that -->
<!-- the distribution -->
<!-- of $X_i$ possesses a density $f(x,\tht)$. The true parameter -->
<!--  $\tht\in \R$ is unknown (example: density of an exponential distribution -->
<!-- $f(x|\tht)=\tht\exp(- \tht x)$) -->
<!-- \bigbreak\noindent -->
<!-- \begin{itemize} -->
<!-- \item  Likelihood function: -->
<!-- $$L(\tht)=\prod_{i=1}^n f(X_i,\tht)$$ -->
<!-- \item  Log-likelihood function: -->
<!-- $$l(\tht)=\log L(\tht)=\sum_{i=1}^n \log f(X_i,\tht)$$ -->
<!-- \item The maximum-likelihood estimator $\thth_n$ maximizes  $l(\tht)$ -->
<!-- \end{itemize} -->
<!-- It can generally be shown that $\tht_n$ is a  consistent estimator of -->
<!-- $\tht$. Derivation of the asymptotic distribution relies on a  Taylor expansion of the derivative  -->
<!-- $l'(\cdot)$ of the log-likelihood function. For some $\psi_n$ in between  $\thth_n$ and -->
<!-- $\tht$ we have -->
<!-- $$l'(\thth)=l'(\tht)+l''(\psi)(\thth_n-\tht)$$ -->
<!-- Since $\thth_n$ maximizes the log-Likelihood function  it follows that -->
<!-- $l'(\thth)=0$. This implies -->
<!-- $$l'(\tht)=-l''(\psi_n)(\thth_n-\tht)$$ -->
<!-- Note that necessarily -->
<!-- $\int_{-\infty}^{\infty} f(x|\vartheta)dx=1$ for all possible values of the true parameter -->
<!--  $\vartheta$. Therefore, -->
<!-- $\int_{-\infty}^{\infty} \frac{\partial}{\partial \tht}f(x|\theta)dx=0$ and -->
<!-- $\int_{-\infty}^{\infty} \frac{\partial^2}{\partial \tht^2}f(x|\theta)dx=0$. -->
<!-- It follows that -->
<!-- $$E(l'(\thth))=n E(\frac{\partial}{\partial \tht} \log f(X_i,\tht)) -->
<!-- =\int_{-\infty}^{\infty} \frac{\frac{\partial}{\partial \tht}  f(x,\tht)} -->
<!-- {f(x,\tht)}f(x,\tht)dx=0$$ -->
<!-- In addition one obtains -->
<!-- $$Var(l'(\thth))=n Var(\frac{\partial}{\partial \tht} \log f(X_i,\tht)) -->
<!-- =nE( (\frac{\frac{\partial}{\partial \tht}  f(X_i,\tht)} -->
<!-- {f(X_i,\tht)})^2)$$ -->
<!-- Define $j(\tht):=E( (\frac{\frac{\partial}{\partial \tht}  f(X_i,\tht)} -->
<!-- {f(X_i,\tht)})^2)$. By the central limit theorem we now have -->
<!-- $$\frac{l'(\tht)}{\sqrt{n \cdot j(\tht)} } \ra_L N(0,1)$$ -->
<!-- and thus -->
<!-- $$\frac{-l''(\psi_n)}{\sqrt{n \cdot j(\tht)}}(\thth_n-\tht) \ra_L N(0,1)$$ -->
<!-- Further analysis requires to study the  term $l''(\psi_n)$. -->
<!-- $$\frac{1}{n}E(l''(\tht))= -->
<!-- E\left( \frac{\frac{\partial^2}{\partial \tht^2}  f(X_i,\tht)} -->
<!-- {f(X_i,\tht)}-( \frac{\frac{\partial}{\partial \tht}  f(X_i,\tht)} -->
<!-- {f(X_i,\tht)})^2\right)=-j(\tht)$$ -->
<!-- $$Var(\frac{1}{n}l''(\tht))=\frac{1}{n} -->
<!-- Var(\frac{\partial^2}{\partial \tht^2}  \log f(X_i,\tht))\ra_{n\ra\infty} 0$$ -->
<!-- $$\Rightarrow \frac{1}{n}l''(\tht)\ra_P -j(\tht)\quad \hbox{ as   } n\ra\infty$$ -->
<!-- Since $\psi_n\ra_P \tht$, we arrive at -->
<!-- $$\frac{1}{n}l''(\psi_n)\ra_P -j(\tht)\quad \hbox{ as } n\ra\infty$$ -->
<!-- and -->
<!-- $$n^{-1/2}\frac{-l''(\psi_n)}{\sqrt{n \cdot j(\tht)}} -->
<!-- =\frac{-\frac{1}{n}l''(\psi_n)}{\sqrt{ j(\tht)}}\ra_P \sqrt{ j(\tht)}$$ -->
<!-- Since $\frac{-l''(\psi_n)}{\sqrt{n \cdot j(\tht)}}(\thth_n-\tht)= -->
<!-- n^{-1/2}\frac{-l''(\psi_n)}{\sqrt{n \cdot j(\tht)}}\cdot n^{1/2}(\thth_n-\tht)$ -->
<!-- we can conclude that -->
<!-- $$\sqrt{ j(\tht)}n^{1/2}(\thth_n-\tht)\ra_L N(0,1),$$ -->
<!-- or equivalently -->
<!-- $$\thth_n-\tht\sim AN(0,\frac{1}{n j(\tht)})$$ -->
<!-- with $n j(\tht)=-E(l''(\tht))$. -->

<!-- The above arguments can easily be generalized to multidimensional parameter vectors $\tht\in\R^p$. $j(\tht)$ then becomes a $p\times p$ matrix, and -->
<!-- $$\thth_n-\tht\sim AN_p(0,\frac{1}{n} j(\tht)^{-1}). $$ -->
<!-- $j(\tht)^{-1}$ is called ``Fisher information matrix''. -->
<!-- \bigbreak -->

<!-- {\bf Example:} Assume an i.i.d. sample $X_1,\dots,X_n$ from an exponential distribution, i.e. the underlying density of $X_i$ is given by $f(x|\tht)=\tht\exp(-\tht x)$. We then have $\mu:=E(X_i)=\frac{1}{\tht}$ as well as $\sigma^2_X:=\textrm{var}(X_i)=\frac{1}{\tht^2}$. The -->
<!-- log-likelihood functions is given by  -->
<!-- $$l(\tht)=\sum_{i=1}^n \log (\tht\exp(-\tht X_i)))=n \log \tht -\sum_{i=1}^n \tht X_i$$ -->
<!-- $$\Rightarrow \quad l'(\tht)=n\frac{1}{\tht} + \sum_{i=1}^n X_i.$$ -->
<!-- As already mentioned above, the maximum-likelihood estimator of $\tht$ then is $\hat\tht=\frac{1}{\bar X}$. -->
<!-- Inference may then be based on likelihood-theory. We have -->
<!-- $$j(\tht)=-\frac{1}{n}E(l''(\tht))=\frac{1}{\tht^2},$$ -->
<!-- and by the above theorem -->
<!-- $$\frac{1}{\bar X}-\tht\sim AN(0,\frac{1}{n j(\tht)})=AN(0,\frac{\tht^2}{n}).$$ -->
<!-- This obviously coincides with the result obtained by the delta-method. -->
