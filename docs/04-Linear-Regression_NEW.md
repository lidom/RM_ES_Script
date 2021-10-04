# Ordinary Least Squares

## Finite-Sample Properties of OLS

### The Classical Linear Regression Model

**Notation:**

-   $y_i \,$ dependent variable.

-   $x_{ik} \,$ $k$th independent variable (or regressor) with
    $k=1,\dots,K \,$.\
    Can be stochastic or deterministic.

-   $\varepsilon_i \,$ stochastic error term

-   $i \,$ indexes the $i$th individual with $i=1,\dots,n$, where $n$ is
    the sample size

**Assumption 1.1: Linearity** 

$$
\begin{align*}
y_i = \sum_{k=1}^K\beta_k x_{ik}+\varepsilon_i, \quad i=1,\dots,n \,.
(\#eq:c3e1)
\end{align*}
$$

<!--
\BeginKnitrBlock{corollary}\iffalse{-91-76-105-110-101-97-114-105-116-121-93-}\fi{}
<span class="corollary" id="cor:unnamed-chunk-1"><strong>(\#cor:unnamed-chunk-1)  \iffalse (Linearity) \fi{} </strong></span>\begin{align*}
y_i = \sum_{k=1}^K\beta_k x_{ik}+\varepsilon_i, \quad i=1,\dots,n \,.
(\#eq:c3e1)
\end{align*}
\EndKnitrBlock{corollary}
-->


Usually, a constant (or intercept) is included, in this case $x_{i1}=1$
for all $i$. In the following we will always assume that a constant is
included in the linear model, unless otherwise stated. A special case of
the above defined linear model is the so-called *simple linear model*,
defined as

$$
\begin{align*}
y_i = \beta_1+\beta_2 x_i +\varepsilon_i, \quad i=1,\dots,n \,.
(\#eq:c3e2)
\end{align*}
$$


Often it is convenient to write \@ref(eq:c3e1) using matrix notation 

$$
\begin{align*}
y_i = \mathbf{x}_i'\boldsymbol{\beta} +\varepsilon_i, \quad i=1,\dots,n \,,
(\#eq:c3e3)
\end{align*}
$$

where $\mathbf{x}_i=(x_{i1},\dots,x_{iK})'$ and
$\boldsymbol{\beta}=(\beta_1,\dots,\beta_K)'$. Stacking all individual rows $i$
leads to 

$$
\begin{align*}
\underset{(n\times 1)}{\mathbf{y}} = \underset{(n\times K)}{\mathbf{X}}\underset{(K\times 1)}{\boldsymbol{\beta}} + \underset{(n\times 1)}{\boldsymbol{\varepsilon}} \, ,
\end{align*}
$$

where


$$
\begin{align*}
\mathbf{y} = \left(\begin{matrix}y_1\\ \vdots\\y_n\end{matrix}\right),\quad
\mathbf{X} = \left( \begin{matrix}
x_{11} & \dots & x_{1K} \\ \vdots & \ddots & \vdots \\ x_{n1} &\dots&x_{nK}\\
\end{matrix}\right),\quad\text{and}\quad \boldsymbol{\varepsilon}=\left(\begin{matrix}\varepsilon_1\\ \vdots\\ \varepsilon_n\end{matrix}\right).
\end{align*}
$$


We begin our analysis of the model in Eq. \@ref(eq:c3e3) under the
framework of the so-called *classic assumptions*.\
**Assumption 1.2: Strict Exogeneity** 

$$\mathbb{E}(\varepsilon_i|\mathbf{X}) = 0$$ 
or equivalently stated for the vector $\boldsymbol{\varepsilon}$

$$\mathbb{E}(\boldsymbol{\varepsilon}|\mathbf{X}) = \mathbf{0}.$$ 

Notice that in the presence of a constant regressor, setting the expectation to zero is a normalization. Note that in econometrics, where we typically have to work with quasi-experimental data, strict exogeneity is a very strong assumption. It also cannot be
fulfilled when the regressors include lagged dependent variables.

**Some Implications of Strict Exogeneity:**

-   The unconditional mean of the error term is zero:
 
$$
\begin{align*} 
\mathbb{E}(\varepsilon_i) = 0\quad(i=1,\dots,n)
(\#eq:c3e4)
\end{align*}
$$

<!--Proof is done in the lecture.-->

\BeginKnitrBlock{proof}
\iffalse{} <span class="proof"><em>Proof. </em></span>  \fi{} From the *Law of Total Expectations* (i.e.,
    $\mathbb{E}(\mathbb{E}(y|\mathbf{x}))=\mathbb{E}(y)$) it follows that
    $$\mathbb{E}(\varepsilon_i)=\mathbb{E}(\mathbb{E}(\varepsilon_i|\mathbf{X})).$$ The strict exogeneity assumption
    then yields $$\mathbb{E}(\mathbb{E}(\varepsilon_i|\mathbf{X}))=\mathbb{E}(0)=0.$$ 
\EndKnitrBlock{proof}

-   Generally, two random variables $x$ and $y$ are said to be
    **orthogonal** if their cross moment is zero: $\mathbb{E}(xy)=0$. Under
    strict exogeneity, the regressors are orthogonal to the error term
    for *all* observations, i.e., 
    \begin{align*}
    \mathbb{E}(x_{jk}\varepsilon_i) = 0\quad(i,j=1,\dots,n; k=1,\dots,K)
    (\#eq:c3e5)
    \end{align*}


\BeginKnitrBlock{proof}
\iffalse{} <span class="proof"><em>Proof. </em></span>  \fi{}\begin{align*}
      \mathbb{E}(x_{jk}\varepsilon_i) &= \mathbb{E}(\mathbb{E}(x_{jk}\varepsilon_i|x_{jk}))\quad{\text{(Law of Total Expect.)}}\\
       &= \mathbb{E}(x_{jk}\mathbb{E}(\varepsilon_i|x_{jk}))\;\;{\text{(Linearity of $\mathbb{E}$-operator)}}
\end{align*}

Now, to show that $\mathbb{E}(x_{jk}\varepsilon_i)=0$, we need to show that $\mathbb{E}(\varepsilon_i|x_{jk})=0$, which is done in the following:
Since $x_{jk}$ is an element of $\mathbf{X}$, the *Law of Iterated Expectations* (i.e., $\mathbb{E}(\mathbb{E}(y|\mathbf{x},\mathbf{z})|\mathbf{x})=\mathbb{E}(y|\mathbf{x})$)
    implies that $$\mathbb{E}(\mathbb{E}(\varepsilon_i|\mathbf{X})|x_{jk})=\mathbb{E}(\varepsilon_i|x_{jk}).$$ The
    strict exogeneity assumption yields
    $$\mathbb{E}(\mathbb{E}(\varepsilon_i|\mathbf{X})|x_{jk})=\mathbb{E}(0|x_{jk})=0.$$ I.e., we have that
    $$\mathbb{E}(\varepsilon_i|x_{jk})=0,$$ which allows us to conclude that
    $$\mathbb{E}(x_{jk}\varepsilon_i)=\mathbb{E}(x_{jk}\mathbb{E}(\varepsilon_i|x_{jk}))=\mathbb{E}(x_{jk}0)=0.$$
\EndKnitrBlock{proof}

-   Because the mean of the error term is zero ($\mathbb{E}(\varepsilon_i)=0$ for all
    $i$), it follows that the orthogonality property
    ($\mathbb{E}(x_{jk}\varepsilon_i)=0$, for all $i,j,k$) is equivalent to a
    zero-correlation property. I.e., that 
    \begin{align*}
      Cov(\varepsilon_i,x_{jk}) = 0;\; i,j=1,\dots,n; k=1,\dots,K
       (\#eq:c3e6)
    \end{align*}
    Therefore, the strict exogeneity assumption implies the requirement
    that regressors are uncorrelated with the current ($i=j$), the past
    ($i<j$) and the future ($i>j$) error terms. Of course, this is
    usually found to be a too strong assumption - particularly in
    time-series contexts.
    
\BeginKnitrBlock{proof}
\iffalse{} <span class="proof"><em>Proof. </em></span>  \fi{}\begin{align*}
      Cov(\varepsilon_i,x_{jk}) &= \mathbb{E}(x_{jk}\varepsilon_i)-\mathbb{E}(x_{jk})\,\mathbb{E}(\varepsilon_i)\quad{\text{(Def.~of Cov)}}\\
       &= \mathbb{E}(x_{jk}\varepsilon_i)\\
       &= 0 
\end{align*}
      
Where the second equal sign holds since $\mathbb{E}(\varepsilon_i)=0$ (see Eq. \@ref(eq:c3e4)) and the third because of orthogonality (see Eq. \@ref(eq:c3e5)).
\EndKnitrBlock{proof}



**Assumption 1.3: Rank Condition** 

$$rank(\mathbf{X})=K\quad\text{a.s.}$$ 

This assumption demands that the event of one regressor being linearly
dependent on the others occurs with a probability equal to zero. (This
is the literal translation of the \"almost surely (a.s.)\" concept.)
This assumption also implies the assumption that $n\geq K$.\
This assumption is a bit dicey and its violation belongs to one of the
classic problems in applied econometrics (keywords: multicollinearity,
dummy variable trap, variance inflation). The violation of this
assumption harms any economic interpretation as we cannot disentangle
the regressors' individual effects on $\mathbf{y}$. Therefore, this
assumption is often referred to as an *identification* assumption.\

**Assumption 1.4: Spherical Error** 

$$
\begin{align*}
\mathbb{E}(\varepsilon_i^2|\mathbf{X}) &= \sigma^2>0\\
\mathbb{E}(\varepsilon_i\varepsilon_j|\mathbf{X}) &= 0,\quad\quad i\neq j.
\end{align*}
$$

Or more compactly written as, 

$$
\begin{align*}
\mathbb{E}(\boldsymbol{\varepsilon}\boldsymbol{\varepsilon}'|\mathbf{X}) = \sigma^2 I_n,\quad\quad \sigma^2>0.
\end{align*}
$$

Thus, we assume that, for a given realization of $\mathbf{X}$, the error
process is uncorrelated ($\mathbb{E}(\varepsilon_i\varepsilon_j|\mathbf{X})=0$, for all
$i\neq j$) and homoscedastic (same $\sigma^2$, for all $i$).

### The Algebra of Least Squares

The OLS estimator $\mathbf{b}$ is defined as the minimizer of a specific loss
function termed *the sum of squared residuals* 

$$
\begin{align*}
SSR(\mathbf{b}^\ast) = \sum_{i=1}^n(y_i-\mathbf{x}_i'\mathbf{b}^\ast)^2\;=\;(\mathbf{y}-\mathbf{X}\mathbf{b}^\ast)'(\mathbf{y}-\mathbf{X}\mathbf{b}^\ast).
\end{align*}
$$

I.e., we have 

$$
\begin{align*}
  \mathbf{b}&:=\arg\min_{\mathbf{b}^\ast\in\mathbb{R}^K}SSR(\mathbf{b}^\ast),
\end{align*}
$$
We can easily minimize $SSR(\mathbf{b}^\ast)$ in closed form:

$$
\begin{align*}
SSR(\mathbf{b}^\ast) 
&= (\mathbf{y}-\mathbf{X}\mathbf{b}^\ast)'(\mathbf{y}-\mathbf{X}\mathbf{b}^\ast)\\
 &= \mathbf{y}'\mathbf{y}-(\mathbf{X}\mathbf{b}^{\ast})'\mathbf{y}-\mathbf{y}'\mathbf{X}\mathbf{b}^{\ast}+\mathbf{b}^{\ast'}\mathbf{X}'\mathbf{X}\mathbf{b}^{\ast}\\
    &= \mathbf{y}'\mathbf{y}-2\mathbf{y}'\mathbf{X}\mathbf{b}^{\ast}+\mathbf{b}^{\ast'}\mathbf{X}'\mathbf{X}\mathbf{b}^{\ast}\\[2ex]
   \Rightarrow\quad\frac{d}{d\mathbf{b}^{\ast}}SSR(\mathbf{b}^{\ast}) &= -2\mathbf{X}'\mathbf{y}+2\mathbf{X}'\mathbf{X}\mathbf{b}^{\ast}
\end{align*}
$$

Setting the first derivative so zero yields the so-called *normal
equations* 

$$
\begin{align*}
\mathbf{X}'\mathbf{X}\mathbf{b} = \mathbf{X}'\mathbf{y},
\end{align*}
$$

which lead to the OLS estimator 

$$
\begin{align*}
\mathbf{b} = (\mathbf{X}'\mathbf{X})^{-1}\mathbf{X}'\mathbf{y},
(\#eq:c3e7)
\end{align*}
$$

where $(\mathbf{X}'\mathbf{X})^{-1}$ exists (a.s.) because of our full
rank assumption (Assumption 3).\
Often it is useful to express $\mathbf{b}$ (and similar other
estimators) in sample moment notation:

$$\mathbf{b}=\mathbf{S}_{\mathbf{x}\mathbf{x}}^{-1}\mathbf{s}_{\mathbf{x}\mathbf{y}},$$

where
$\mathbf{S}_{\mathbf{x}\mathbf{x}}=n^{-1}\mathbf{X}'\mathbf{X}=n^{-1}\sum_i\mathbf{x}_i\mathbf{x}_i'$
and
$\mathbf{s}_{\mathbf{x}\mathbf{y}}=n^{-1}\mathbf{X}'\mathbf{y}=n^{-1}\sum_i\mathbf{x}_iy_i$.
This notation is more convenient for developing our large sample
results.\

### Some quantities of interest: {#some-quantities-of-interest .unnumbered}

-   The *(OLS) fitted value*: $\hat{y}_i=\mathbf{x}_i\mathbf{b}$\
    In matrix notation:
    $\hat{\mathbf{y}}=\mathbf{X}(\mathbf{X}'\mathbf{X})^{-1}\mathbf{X}'\mathbf{y} = \mathbf{P}\mathbf{y}$

-   The *(OLS) residual*: $\hat{\varepsilon_i}=y_i-\hat{y}_i$\
    In matrix notation:
    $\hat{\boldsymbol{\varepsilon}} = \mathbf{y}-\hat{\mathbf{y}} = \left(\mathbf{I}_n-\mathbf{X}(\mathbf{X}'\mathbf{X})^{-1}\mathbf{X}'\right)\mathbf{y} = \mathbf{M}\mathbf{y}$,

where $\mathbf{P}=\mathbf{X}(\mathbf{X}'\mathbf{X})^{-1}\mathbf{X}'$ is
a so-called orthogonal projection matrix that projects any vector into
the column space spanned by $\mathbf{X}$ and
$\mathbf{M}=\mathbf{I}_n-\mathbf{X}(\mathbf{X}'\mathbf{X})^{-1}\mathbf{X}'$
is the associated orthogonal projection matrix that projects any vector
into the vector space that is orthogonal to that spanned by
$\mathbf{X}$. Projection matrices have some nice properties, listed in
the following lemma.

**Lemma 3.1.1 (Orthogonal Projection matrices)** 
For $\mathbf{P}=\mathbf{X}(\mathbf{X}'\mathbf{X})^{-1}\mathbf{X}'$ and
$\mathbf{M}=\mathbf{I}_n-\mathbf{P}$ with $\mathbf{X}$ being of full
rank it holds:

-   $\mathbf{P}$ and $\mathbf{M}$ are symmetric and idempotent, i.e.:
    $$\mathbf{P}\mathbf{P}=\mathbf{P}\quad\text{ and }\quad \mathbf{M}\mathbf{M}=\mathbf{M}.$$

-   Further properties:
    $$\mathbf{X}'\mathbf{P}=\mathbf{X}',\quad \mathbf{X}'\mathbf{M}=\mathbf{0},\quad\text{ and }\quad \mathbf{P}\mathbf{M}=\mathbf{0}.$$

Proofs follow directly from the definitions of $\mathbf{P}$ and
$\mathbf{M}$.\
Using these results we obtain the following proposition on the OLS
residuals and OLS fitted values.

**Proposition 3.1.2 (OLS residuals)** 
For the OLS residuals and the OLS fitted values it holds that 

$$
\begin{align*}
    \mathbf{X}'\hat{\boldsymbol{\varepsilon}} &= \mathbf{0}, \quad\text{and}\\
    \mathbf{y}'\mathbf{y} &= \hat{\mathbf{y}}'\hat{\mathbf{y}}+\hat{\boldsymbol{\varepsilon}}'\hat{\boldsymbol{\varepsilon}}.
\end{align*}
$$

\BeginKnitrBlock{proof}
\iffalse{} <span class="proof"><em>Proof. </em></span>  \fi{}The first result can be shown as following:
\begin{align*}
  \mathbf{X}'\hat{\boldsymbol{\varepsilon}} 
   &= \mathbf{X}'\mathbf{M}\mathbf{y}\quad\text{(By Def. of $\mathbf{M}$)}\\
   &= \mathbf{0}\mathbf{y}\quad\text{(By Lemma 3.1.1 part (ii))}\\
   &= \underset{(K\times 1)}{\mathbf{0}}
\end{align*} 
The second result follows from:

\begin{align*}
  \mathbf{y}'\mathbf{y} &= (\mathbf{P}\mathbf{y}+\mathbf{M}\mathbf{y})'(\mathbf{P}\mathbf{y}+\mathbf{M}\mathbf{y})\quad\text{(By Def.~of $\mathbf{P}$ and $\mathbf{M}$)}\\
   &= (\mathbf{y}'\mathbf{P}'+\mathbf{y}'\mathbf{M}')(\mathbf{P}\mathbf{y}+\mathbf{M}\mathbf{y})\\
   &= \mathbf{y}'\mathbf{P}'\mathbf{P}\mathbf{y}+\mathbf{y}'\mathbf{M}'\mathbf{M}\mathbf{y}+\mathbf{0}\quad\text{(By Lemma 3.1.1 part (ii))}\\
   &= \hat{\mathbf{y}}'\hat{\mathbf{y}}+\hat{\boldsymbol{\varepsilon}}'\hat{\boldsymbol{\varepsilon}}
\end{align*}
\EndKnitrBlock{proof}

The vector of residuals $\hat{\boldsymbol{\varepsilon}}$ has only $n-K$ so-called *degrees
of freedom*. The vector looses $K$ degrees of freedom, since it has to
satisfy the $K$ linear restrictions ($\mathbf{X}'\hat{\boldsymbol{\varepsilon}}=\mathbf{0}$).
Particularly, in the case with intercept we have that
$\sum_{i=1}^n\hat{\boldsymbol{\varepsilon}_i}=\mathbf{0}$.\
This loss of $K$ degrees of freedom also appears in the definition of
the *unbiased* variance estimator 

$$
\begin{align*}
s^2 = \frac{1}{n-K}\sum_{i=1}^n\hat{\varepsilon_i^2}.
(\#eq:c3e8)
\end{align*}
$$

### Coefficient of determination

The total sample variance of the dependent variable
$\sum_{i=1}^n\left(y_i-\bar{y}\right)^2$, where
$\bar{y}=\frac{1}{n}\sum_{i=1}^ny_i$, can be decomposed as following:

**Proposition 3.1.3 (Variance decomposition)** 
For the OLS regression of the linear model (\@ref(eq:c3e1) with intercept it holds that

$$
\begin{align*}
  \underset{\text{total variance}}{\sum_{i=1}^n\left(y_i-\bar{y}\right)^2} = \underset{\text{explained variance}}{\sum_{i=1}^n\left(\hat{y}_i-\bar{\hat{y}}\right)^2}+\underset{\text{unexplained variance}}{\sum_{i=1}^n\hat{\varepsilon_i^2 \,\,.}}
\end{align*}
$$

<!-- Proof is done in the lecture.\ -->

\BeginKnitrBlock{proof}
\iffalse{} <span class="proof"><em>Proof. </em></span>  \fi{}- As a consequence of Prop. 3.1.2 we have for regressions with intercept:
    $\sum_{i=1}^n\hat{\varepsilon_i=0}$. Hence, from $y_i=\hat{y}_i+\hat{\varepsilon_i}$
    it follows that $$\begin{align*}
      \frac{1}{n}\sum_{i=1}^n y_i &= \frac{1}{n}\sum_{i=1}^n \hat{y}_i+\frac{1}{n}\sum_{i=1}^n \hat{\varepsilon_i} \\
      \bar{y} &= \bar{\hat{y}}_i+0 \end{align*}$$

- From Prop. 3.1.2 we know that: 

\begin{align*}
\mathbf{y}'\mathbf{y} &= \hat{\mathbf{y}}'\hat{\mathbf{y}}+\hat{\boldsymbol{\varepsilon}}'\hat{\boldsymbol{\varepsilon}} \\
       \mathbf{y}'\mathbf{y} -n\bar{y}^2 &= \hat{\mathbf{y}}'\hat{\mathbf{y}}-n\bar{y}^2+\hat{\boldsymbol{\varepsilon}}'\hat{\boldsymbol{\varepsilon}} \\
       \mathbf{y}'\mathbf{y}-n\bar{y}^2 &= \hat{\mathbf{y}}'\hat{\mathbf{y}}-n\bar{\hat{y}}^2+\hat{\boldsymbol{\varepsilon}}'
       \hat{\boldsymbol{\varepsilon}}\quad\text{(By our result above.)} \\
       \sum_{i=1}^n y_i^2-n\bar{y}^2 &= \sum_{i=1}^n\hat{y}_i^2-n\bar{\hat{y}}^2+\sum_{i=1}^n\hat{\varepsilon}_i^2 \\
       \sum_{i=1}^n (y_i-\bar{y})^2 &= \sum_{i=1}^n (\hat{y}_i-\bar{\hat{y}})^2+\sum_{i=1}^n \hat{\varepsilon}_i^2
\end{align*}
\EndKnitrBlock{proof}

The larger the proportion of the explained variance, the better is the
fit of the model. This motivates the definition of the so-called $R^2$
coefficient of determination: 

$$
\begin{align*}
  R^2=\frac{\sum_{i=1}^n\left(\hat{y}_i-\bar{\hat{y}}\right)^2}{\sum_{i=1}^n\left(y_i-\bar{y}\right)^2}\;=\;1-\frac{\sum_{i=1}^n\hat{u}_i^2}{\sum_{i=1}^n\left(y_i-\bar{y}\right)^2}
\end{align*}
$$

Obviously, we have that $0\leq R^2\leq 1$. The closer $R^2$ lies to $1$,
the better is the fit of the model to the observed data. However, a
high/low $R^2$ does not mean a validation/falsification of the estimated
model. Any relation (i.e., model assumption) needs a plausible
explanation from relevant economic theory.

The most often criticized disadvantage of the $R^2$ is that additional
regressors (relevant or not) will always increase the $R^2$.

**Proposition 3.1.4 ($R^2$ increase)**

Let $R^2_1$ and $R^2_2$ result from

$$
\begin{align*}
    \mathbf{y} &= \mathbf{X}_1\mathbf{b}_{11}+\hat{\boldsymbol{\varepsilon}_1} \quad\text{and}\\
    \mathbf{y} &= \mathbf{X}_1\mathbf{b}_{21}+\mathbf{X}_2\mathbf{b}_{22}+\hat{\boldsymbol{\varepsilon}_2}.
\end{align*}
$$

It then holds that $R^2_2\geq R^2_1$.

\BeginKnitrBlock{proof}
\iffalse{} <span class="proof"><em>Proof. </em></span>  \fi{}Consider the sum of squared residuals,

\begin{align*}
S(\mathbf{\mathfrak{b}}_{21},\mathbf{\mathfrak{b}}_{22})=(\mathbf{y}-\mathbf{X}_1\mathbf{\mathfrak{b}}_{21}+\mathbf{X}_2\mathbf{\mathfrak{b}}_{22})'(\mathbf{y}-\mathbf{X}_1\mathbf{\mathfrak{b}}_{21}+\mathbf{X}_2\mathbf{\mathfrak{b}}_{22})
\end{align*}
By definition, this sum is minimized by the OLS estimators $\mathbf{b}_{21}$
and $\mathbf{b}_{22}$, i.e.,
$S(\mathbf{b}_{21},\mathbf{b}_{22})\leq S(\mathbf{\mathfrak{b}}_{21},\mathbf{\mathfrak{b}}_{22})$.
Consequently, 

\begin{align*}
\hat{\boldsymbol{\varepsilon}}_{2}'\hat{\boldsymbol{\varepsilon}}_{2}=S(\mathbf{b}_{21},\mathbf{b}_{22})\leq S(\mathbf{b}_{{\color{red}{11}}},0)=\hat{\boldsymbol{\varepsilon}}_{1}'\hat{\boldsymbol{\varepsilon}}_{1}
\end{align*}
which implies the statement:

\begin{align*}
R_2^2=1-\frac{\hat{\boldsymbol{\varepsilon}}_{2}'\hat{\boldsymbol{\varepsilon}}_{2}}{\sum_{i=1}^n\left(y_i-\bar{y}\right)^2}\geq
1-\frac{\hat{\boldsymbol{\varepsilon}}_{1}'\hat{\boldsymbol{\varepsilon}}_{1}}{\sum_{i=1}^n\left(y_i-\bar{y}\right)^2}=R_1^2
\end{align*}
\EndKnitrBlock{proof}

Because of this, the $R^2$ cannot be used as a criterion for model
selection. Possible solutions are given by penalized criterions such as
the so-called *adjusted $R^2$* defined as 

$$
\begin{align*}
  \overline{R}^2 &= 1-\frac{ \frac{1}{n-K} \sum_{i=1}^n \hat{u}_i^2}{ \frac{1}{n-1} \sum_{i=1}^n \left(y_i-\bar{y}\right)^2} \\
   &= 1-\frac{n-1}{n-K}\left(1-R^2\right) \\
    &= 1-\frac{n-1}{n-K}+\frac{n-1}{n-K}R^2\quad+\frac{K-1}{n-K}R^2-\frac{K-1}{n-K}R^2 \\
    &= 1-\frac{n-1}{n-K}+R^2\quad+\frac{K-1}{n-K}R^2 \\
    &= -\frac{K-1}{n-K}+R^2\quad+\frac{K-1}{n-K}R^2 \\
   &= R^2-\frac{K-1}{n-K}\left(1-R^2\right) \leq R^2
\end{align*}
$$

The adjustment is in terms of degrees of freedom.

### Partitioned regression model {#partitioned-regression-model .unnumbered}

Already in the first edition of Econometrica (1933) Frisch and Waugh
pointed to an interesting property of multivariate linear regression
analysis, which was later generalized to by Lovell (1963). The so-called
Frisch-Waugh-Lovell (FWL) theorem points to a property of the OLS
estimation method, which allows to gain a deeper understanding of the
estimation method that is useful for the interpretation of the estimated
coefficients.

$$
\begin{align*}
  \mathbf{y} &= \mathbf{X}_1\mathbf{b}_1+\mathbf{X}_2\mathbf{b}_2+\hat{\boldsymbol{\varepsilon}} =  (\mathbf{X}_1,\mathbf{X}_2)\left(\begin{matrix}\mathbf{b}_1\\\mathbf{b}_2\end{matrix}\right)+\hat{\boldsymbol{\varepsilon}},
(\#eq:c3e9)
\end{align*}
$$

where $rank(\mathbf{X}_j)=K_j$ for $j=1,2$.\
A regression of $\mathbf{y}$ only on $\mathbf{X}_2$ (not on $\mathbf{X}_1$), which
however *takes into account the effect of $\mathbf{X}_1$*, has to be done as
following:

$$
\begin{align*}
  \mathbf{M}_1\mathbf{y} = \mathbf{M}_1\mathbf{X}_2\hat{\boldsymbol{\beta}}_2+\hat{\mathbf{v}},
(\#eq:c3e10)
\end{align*}
$$

where $\mathbf{M}_1=\mathbf{I}_n-\mathbf{X}_1(\mathbf{X}_1'\mathbf{X}_1)^{-1}\mathbf{X}_1'$. Note that (\@ref(eq:c3e10) is a regression model full of residuals: The dependent variables $\mathbf{M}_1\mathbf{y}$ are the residuals from regressing $\mathbf{y}$ on $\mathbf{X}_1$ and the $K_2$ columns in the matrix of independent variables $\mathbf{M}_1\mathbf{X}_2$ are the residuals from the regressing $\mathbf{X}_2$ column-wise on $\mathbf{X}_1$. This means that the variables $\mathbf{M}_1\mathbf{y}$ and $\mathbf{M}_1\mathbf{X}_2$ contain only those parts of $\mathbf{y}$ and $\mathbf{X}_2$, which are orthogonal to $\mathbf{X}_1$; the effect of $\mathbf{X}_1$ is "*partialled out*". By the FWL theorem we have that:

**Proposition 3.1.5 (Frisch-Waugh-Lovell theorem)**
For the equations (\@ref(eq:c3e9)) and \@ref(eq:c3e10)) it holds that:
$$\hat{\boldsymbol{\beta}}_2=\mathbf{b}_2\quad\text{and}\quad \hat{\boldsymbol{\varepsilon}}=\hat{\mathbf{v}}.$$

\BeginKnitrBlock{proof}
\iffalse{} <span class="proof"><em>Proof. </em></span>  \fi{}The OLS estimator $\hat{\boldsymbol{\beta}}_2$ is given by

$$
\begin{align*}
\hat{\boldsymbol{\beta}}_2 &= \left((\mathbf{M}_1\mathbf{X}_2)'(\mathbf{M}_1\mathbf{X}_2)\right)^{-1}(\mathbf{M}_1\mathbf{X}_2)'\mathbf{y}\nonumber\\
 &= \left(\mathbf{X}_2'\mathbf{M}_1\mathbf{X}_2\right)^{-1}\mathbf{X}_2'\mathbf{M}_1\mathbf{y}
(\#eq:c3e11)
\end{align*}
$$

In the following, we show that $\hat{\boldsymbol{\beta}}_2=\mathbf{b}_2$:\
From the normal equations for $\mathbf{b}$, we have that (using the partition
$X =\left[\mathbf{X}_1,\mathbf{X}_2\right]$): 

$$
\begin{align*}
(\mathbf{X}\mathbf{X})^{-1}\mathbf{b}&=\mathbf{X}'\mathbf{y}\\
\left(\begin{matrix}\mathbf{X}_1'\mathbf{X}_1&\mathbf{X}_1'\mathbf{X}_2\\\mathbf{X}_2'\mathbf{X}_1&\mathbf{X}_2'\mathbf{X}_2\end{matrix}\right)\left(\begin{matrix}\mathbf{b}_1\\\mathbf{b}_2\end{matrix}\right)&=\left(\begin{matrix}\mathbf{X}_1'\mathbf{y}\\\mathbf{X}_2'\mathbf{y}\end{matrix}\right),
\end{align*}
$$

which is an equation system with two equations:

$$
\begin{align*}
\mathbf{X}_1'\mathbf{X}_1\mathbf{b}_1 + \mathbf{X}_1'\mathbf{X}_2\mathbf{b}_2 &=\mathbf{X}_1'\mathbf{y}
(\#eq:c3e12)
\end{align*}
$$
    
$$
\begin{align*}
\mathbf{X}_2'\mathbf{X}_1\mathbf{b}_1 + \mathbf{X}_2'\mathbf{X}_2\mathbf{b}_2 &=\mathbf{X}_2'\mathbf{y} 
(\#eq:c3e13)
\end{align*}
$$

>From \@ref(eq:c3e12):

$$
\begin{align*}
\mathbf{b}_1 = \left(\mathbf{X}_1'\mathbf{X}_1\right)^{-1}\left(\mathbf{X}_1'\mathbf{y} - \mathbf{X}_1'\mathbf{X}_2\mathbf{b}_2\right)
(\#eq:c3e14)
\end{align*}
$$

Plugging \@ref(eq:c3e14) into \@ref(eq:c3e13) yields,

$$
\begin{align*}
\mathbf{X}_2'\mathbf{X}_1\left\{\left(\mathbf{X}_1'\mathbf{X}_1\right)^{-1}\left(\mathbf{X}_1'\mathbf{y} - \mathbf{X}_1'\mathbf{X}_2\mathbf{b}_2\right)\right\} + \mathbf{X}_2'\mathbf{X}_2\mathbf{b}_2 &=\mathbf{X}_2'\mathbf{y}\nonumber\\
- \mathbf{X}_2'\mathbf{X}_1\left(\mathbf{X}_1'\mathbf{X}_1\right)^{-1}\mathbf{X}_1'\mathbf{X}_2\mathbf{b}_2 + \mathbf{X}_2'\mathbf{X}_2\mathbf{b}_2 &=\mathbf{X}_2'\mathbf{y}- \mathbf{X}_2'\mathbf{X}_1\left(\mathbf{X}_1'\mathbf{X}_1\right)^{-1}\mathbf{X}_1'\mathbf{y}\nonumber\\
\left(\mathbf{X}_2'\mathbf{X}_2 - \mathbf{X}_2'\mathbf{X}_1\left(\mathbf{X}_1'\mathbf{X}_1\right)^{-1}\mathbf{X}_1'\mathbf{X}_2\right)\mathbf{b}_2 &=\mathbf{X}_2'\left(I- \mathbf{X}_1\left(\mathbf{X}_1'\mathbf{X}_1\right)^{-1}\mathbf{X}_1'\right)\mathbf{y}\nonumber\\
\mathbf{X}_2'\left(I - \mathbf{X}_1\left(\mathbf{X}_1'\mathbf{X}_1\right)^{-1}\mathbf{X}_1'\right)\mathbf{X}_2\mathbf{b}_2 &=\mathbf{X}_2'\left(I- \mathbf{X}_1\left(\mathbf{X}_1'\mathbf{X}_1\right)^{-1}\mathbf{X}_1'\right)\mathbf{y}\nonumber\\
\mathbf{X}_2'\mathbf{M}_1\mathbf{X}_2\mathbf{b}_2 &=\mathbf{X}_2'\mathbf{M}_1\mathbf{y}\nonumber\\
\Leftrightarrow \mathbf{b}_2 &=\left(\mathbf{X}_2'\mathbf{M}_1\mathbf{X}_2\right)^{-1}\mathbf{X}_2'\mathbf{M}_1\mathbf{y}
(\#eq:c3e15)
\end{align*}
$$

>From \@ref(eq:c3e11) and \@ref(eq:c3e15) it follows that $\hat{\boldsymbol{\beta}}_2=\mathbf{b}_2$ as stated by the proposition.\
It remains to show that $\hat{\boldsymbol{\varepsilon}}=\hat{\mathbf{v}}$:\
Observe that

$$
\begin{align*}
\hat{\mathbf{v}} &= \mathbf{M}_1\mathbf{y}-\mathbf{M}_1\mathbf{X}_2\hat{\boldsymbol{\beta}}_2.
\end{align*}
$$

But, using \@ref(eq:c3e14)

$$
\begin{align*}
\hat{\boldsymbol{\varepsilon}}
&= \mathbf{y}-\mathbf{X}_1{\color{red}{\mathbf{b}_1}-\mathbf{X}_2\mathbf{b}_2} \\
&= \mathbf{y}-\mathbf{X}_1{\color{red}{\left(\mathbf{X}_1'\mathbf{X}_1\right)^{-1}\left(\mathbf{X}_1'\mathbf{y}-\mathbf{X}_1'\mathbf{X}_2\mathbf{b}_2\right)}} -\mathbf{X}_2\mathbf{b}_2\\
&= \mathbf{y}-\mathbf{P}_1\mathbf{y}-\left(\mathbf{X}_2\mathbf{b}_2-\mathbf{P}_1\mathbf{X}_2\mathbf{b}_2 \right)\\
&= \mathbf{M}_1\mathbf{y}-\mathbf{M}_1\mathbf{X}_2\mathbf{b}_2\\
&= \hat{\mathbf{v}}
\end{align*}
$$
\EndKnitrBlock{proof}

### Finite-Sample Properties of OLS

Notice that, by contrast to (the true but unknown) parameter vector
$\boldsymbol{\beta}$, $\mathbf{b}$ is a stochastic quantity, since it depends on
$\boldsymbol{\varepsilon}$ through $\mathbf{y}$. The stochastic difference $\mathbf{b}-\boldsymbol{\beta}$
is termed the **sampling error**:

$$
\begin{align*}
\mathbf{b}-\boldsymbol{\beta} &= (\mathbf{X}'\mathbf{X})^{-1}\mathbf{X}'\mathbf{y}-\boldsymbol{\beta}\\
 &= (\mathbf{X}'\mathbf{X})^{-1}\mathbf{X}'(\mathbf{X}\boldsymbol{\beta}+\boldsymbol{\varepsilon})-\boldsymbol{\beta}\quad\text{(By Assumption 1)}\\
 &= (\mathbf{X}'\mathbf{X})^{-1}\mathbf{X}'\mathbf{X}\boldsymbol{\beta}+(\mathbf{X}'\mathbf{X})^{-1}\mathbf{X}'\boldsymbol{\varepsilon}-\boldsymbol{\beta}\\
 &= \boldsymbol{\beta}+(\mathbf{X}'\mathbf{X})^{-1}\mathbf{X}'\boldsymbol{\varepsilon}-\boldsymbol{\beta}\\
 &= (\mathbf{X}'\mathbf{X})^{-1}\mathbf{X}'\boldsymbol{\varepsilon} \,, 
\end{align*}
$$

where the first equality holds by Eq. \@ref(eq:c3e7)

The distribution of $\mathbf{b}$ depends (among others) on the sample
size $n$, although this is not made explicitly by our notation. In this
section, we focus on the case of a fix, finite sample size $n$.

\BeginKnitrBlock{theorem}\iffalse{-91-70-105-110-105-116-101-32-83-97-109-112-108-101-32-80-114-111-112-101-114-116-105-101-115-93-}\fi{}
<span class="theorem" id="thm:GMT"><strong>(\#thm:GMT)  \iffalse (Finite Sample Properties) \fi{} </strong></span>
The OLS estimator $\mathbf{b}$

-   is an unbiased estimator: $\mathbb{E}(\mathbf{b}|\mathbf{X})=\boldsymbol{\beta}$

-   has variance: $\mathbb{V}(\mathbf{b}|\mathbf{X})=\sigma^2(\mathbf{X}'\mathbf{X})^{-1}$

-   (Gauss-Markov Theorem) is efficient in the class of all linear
    unbiased estimators. That is, for any unbiased estimator
    $\tilde{\mathbf{b}}$ that is linear in $\mathbf{y}$, we have:
    $\mathbb{V}(\tilde{\mathbf{b}}|\mathbf{X}) \geq \mathbb{V}(\mathbf{b} | \mathbf{X})$ in the matrix sense.
\EndKnitrBlock{theorem}

While part (ii) and (iii) need all of the classical Assumptions 1.1-1.4,
part (i) needs only the Assumptions 1.1-1.3.

Note that, by saying: "$\mathbb{V}(\tilde{\mathbf{b}}|\mathbf{X}) \geq \mathbb{V}(\mathbf{b} | \mathbf{X})$ in the
matrix sense", we mean that
$\mathbb{V}(\tilde{\mathbf{b}}|\mathbf{X}) - \mathbb{V}(\mathbf{b} | \mathbf{X}) = \mathbf{D}$, where $\mathbf{D}$ is
a *positive semidefinite* $K\times K$ matrix, i.e.,
$\mathbf{a}'\mathbf{D}\mathbf{a}\geq 0$ for any $K$-dimensional vector
$\mathbf{a}$. Observe that this implies that
$\mathbb{V}(\tilde{\text{b}}_k|\mathbf{X}) \geq \mathbb{V}({\textrm{b}}_k | \mathbf{X})$ for any
$k=1,\dots,K$.\

Proof of Theorem \@ref(thm:GMT)
is done in the lecture.\

Proof:\
**Part (i):** 

$$
\begin{align*}
\mathbb{E}(\mathbf{b}|\mathbf{X}) &= \mathbb{E}\left((\mathbf{X}'\mathbf{X})^{-1}\mathbf{X}'\mathbf{y}|\mathbf{X}\right)\\
   &= \mathbb{E}\left((\mathbf{X}'\mathbf{X})^{-1}\mathbf{X}'(\mathbf{X}\boldsymbol{\beta}+\boldsymbol{\varepsilon})|\mathbf{X}\right)\\
   &= \mathbb{E}\left((\mathbf{X}'\mathbf{X})^{-1}\mathbf{X}'\mathbf{X}\boldsymbol{\beta}+(\mathbf{X}'\mathbf{X})^{-1}\mathbf{X}'\boldsymbol{\varepsilon}|\mathbf{X}\right)\\
   &= \boldsymbol{\beta}+(\mathbf{X}'\mathbf{X})^{-1}\mathbf{X}'\mathbb{E}\left(\boldsymbol{\varepsilon}|\mathbf{X}\right)\;=\;\boldsymbol{\beta},
\end{align*}
$$

where the last step follows from the strict exogeneity assumption.\
**Part (ii):** 

$$
\begin{align*}
\mathbb{V}(\mathbf{b}|\mathbf{X})
  &=\mathbb{V}(\mathbf{b}-\boldsymbol{\beta}|\mathbf{X})\quad\left(\text{Since $\boldsymbol{\beta}$ is not random}\right)\\
  &=\mathbb{V}\left(\left(\mathbf{X}'\mathbf{X}\right)^{-1}\mathbf{X}'\boldsymbol{\varepsilon}|\mathbf{X}\right)\\
  &=\left(\mathbf{X}'\mathbf{X}\right)^{-1}\mathbf{X}'\mathbb{V}\left(\boldsymbol{\varepsilon}|\mathbf{X}\right)\mathbf{X}\left(\mathbf{X}'\mathbf{X}\right)^{-1}\\
  &=\sigma^2\left(\mathbf{X}'\mathbf{X}\right)^{-1}\mathbf{X}'I_n\mathbf{X}\left(\mathbf{X}'\mathbf{X}\right)^{-1}\\
  &=\sigma^2\left(\mathbf{X}'\mathbf{X}\right)^{-1}
\end{align*}
$$

**Part (iii),
Gauss-Markov:**\
Since $\tilde{\mathbf{b}}$ is assumed to be linear in $\mathbf{y}$, we can
write 

$$
\begin{align*}
\tilde{\mathbf{b}}=\mathbf{C}\mathbf{y},
\end{align*}
$$ 

where $\mathbf{C}$ is
some $K\times n$ matrix, which is a function of $\mathbf{X}$ and/or nonrandom
components.\
Adding a $K\times n$ zero matrix $\mathbf{0}$ yields 

$$
\begin{align*}
\tilde{\mathbf{b}}=\Big(\mathbf{C}\overbrace{-\left(\mathbf{X}'\mathbf{X}\right)^{-1}\mathbf{X}'+\left(\mathbf{X}'\mathbf{X}\right)^{-1}\mathbf{X}'}^{=\mathbf{0}}\Big)\mathbf{y}.
\end{align*}
$$

Let now $\mathbf{D}=\mathbf{C}-\left(\mathbf{X}'\mathbf{X}\right)^{-1}\mathbf{X}'$, then

$$
\begin{align*}
\tilde{\mathbf{b}}&=\mathbf{D}\mathbf{y} + \left(\mathbf{X}'\mathbf{X}\right)^{-1}\mathbf{X}'\mathbf{y}\nonumber\\
\tilde{\mathbf{b}}&=\mathbf{D}\left(\mathbf{X}\boldsymbol{\beta}+\boldsymbol{\varepsilon}\right) + \left(\mathbf{X}'\mathbf{X}\right)^{-1}\mathbf{X}'\mathbf{y}\nonumber\\
\tilde{\mathbf{b}}&=\mathbf{D}\mathbf{X}\boldsymbol{\beta}+\mathbf{D}\boldsymbol{\varepsilon} + \mathbf{b}
(\#eq:c3e16)\\[2ex]
\Rightarrow\quad\mathbb{E}(\tilde{\mathbf{b}}|\mathbf{X})&=\mathbb{E}(\mathbf{D}\mathbf{X}\boldsymbol{\beta}|\mathbf{X})+\mathbb{E}(\mathbf{D}\boldsymbol{\varepsilon}|\mathbf{X})+\mathbb{E}(\mathbf{b}|\mathbf{X})\nonumber\\
&=\mathbf{D}\mathbf{X}\boldsymbol{\beta}+\mathbf{0}+\boldsymbol{\beta}
(\#eq:c3e17)
\end{align*}
$$

Since $\tilde{\mathbf{b}}$ is (by assumption) unbiased, we have that
$\mathbb{E}(\tilde{\mathbf{b}}|\mathbf{X})=\boldsymbol{\beta}$. The latter, together with \@ref(eq:c3e17), implies that $\mathbf{D}\mathbf{X}=\mathbf{0}$. Plugging $\mathbf{D}\mathbf{X}=\mathbf{0}$ into \@ref(eq:c3e16) yields, 

$$
\begin{align*}
\tilde{\mathbf{b}}&=\mathbf{D}\boldsymbol{\varepsilon} + \mathbf{b}\nonumber\\
\tilde{\mathbf{b}}-\boldsymbol{\beta}&=\mathbf{D}\boldsymbol{\varepsilon} + (\mathbf{b}-\boldsymbol{\beta})\quad(\text{Adding a zero vector $\boldsymbol{\beta}-\boldsymbol{\beta}$})\nonumber\\
\tilde{\mathbf{b}}-\boldsymbol{\beta}&=\mathbf{D}\boldsymbol{\varepsilon} + \left(\mathbf{X}'\mathbf{X}\right)^{-1}\mathbf{X}'\boldsymbol{\varepsilon}\quad(\text{Sampling error expression})\nonumber\\
\tilde{\mathbf{b}}-\boldsymbol{\beta}&=\left(\mathbf{D} + \left(\mathbf{X}'\mathbf{X}\right)^{-1}\mathbf{X}'\right)\boldsymbol{\varepsilon}
(\#eq:c3e18)
\end{align*}
$$

So, 

$$
\begin{align*}
  \mathbb{V}(\tilde{\mathbf{b}}|\mathbf{X})
  &= \mathbb{V}(\tilde{\mathbf{b}}-\boldsymbol{\beta}|\mathbf{X})\quad\left(\text{Since } \boldsymbol{\beta} \text{ is not random}\right)\\
  &= \mathbb{V}((\mathbf{D} + (\mathbf{X}'\mathbf{X})^{-1}\mathbf{X}')\boldsymbol{\varepsilon}|\mathbf{X})\\
  &= (\mathbf{D} + (\mathbf{X}'\mathbf{X})^{-1}\mathbf{X}')\mathbb{V}(\boldsymbol{\varepsilon}|\mathbf{X})(\mathbf{D}' + X(\mathbf{X}'\mathbf{X})^{-1})\\
  &= \sigma^2(\mathbf{D} + (\mathbf{X}'\mathbf{X})^{-1}\mathbf{X}')I_n(\mathbf{D}' + X(\mathbf{X}'\mathbf{X})^{-1})\\
  &= \sigma^2\left(\mathbf{D}\mathbf{D}'+(\mathbf{X}'\mathbf{X})^{-1}\right)\quad(\text{using that } \mathbf{D}\mathbf{X}=\mathbf{0}) \\
  &\geq\sigma^2(\mathbf{X}'\mathbf{X})^{-1} \\
  &= \mathbb{V}(\mathbf{b}|\mathbf{X}) \quad(\text{Since }\mathbf{D}\mathbf{D}' \text{ is pos.~semidef.})
\end{align*}
$$

where the second equality uses Eq. \@ref(eq:c3e18).

Showing that $\mathbf{D}\mathbf{D}'$ is positive definite:

$$
\begin{align*}
  \mathbf{a}'\mathbf{D}\mathbf{D}'\mathbf{a}=(\mathbf{D}'\mathbf{a})'(\mathbf{D}'\mathbf{a})=\tilde{\mathbf{a}}'\tilde{\mathbf{a}}\geq 0,
\end{align*}
$$

where $\tilde{\mathbf{a}}$ is a $K$ dimensional column-vector.\
Remember:

-   $(\mathbf{A}+\mathbf{B})'=\mathbf{A}'+\mathbf{B}'$

-   $(\mathbf{AB})'=\mathbf{B}'\mathbf{A}'$

-   $\mathbf{A}' =\mathbf{A}$ $\Leftrightarrow$ $\mathbf{A}$ is a
    symmetric matrix

Under Assumptions 1.1-1.4, we have that: $$\mathbb{E}(s^2|\mathbf{X})=\sigma^2,$$ and
hence $\mathbb{E}(s^2)=\sigma^2$, provided that $n>K$ (otherwise $s^2$ isn't
well defined).

<!-- Proof is done in the lecture.\ -->

\BeginKnitrBlock{proof}
\iffalse{} <span class="proof"><em>Proof. </em></span>  \fi{}In the following we show that $\mathbb{E}(s^2|\mathbf{X})=\sigma^2$, where
$$s^2=\frac{1}{n-K}\sum_{i=1}^n\hat{\varepsilon_i}^2=\frac{\hat{\boldsymbol{\varepsilon}}'\hat{\boldsymbol{\varepsilon}}}{n-K}.$$
In fact, it will be convenient to show the following equivalent
statement: $$\mathbb{E}(\hat{\boldsymbol{\varepsilon}}'\hat{\boldsymbol{\varepsilon}}|\mathbf{X})=\sigma^2(n-K).$$ Note that
$$\begin{align*}
\hat{\boldsymbol{\varepsilon}}'\hat{\boldsymbol{\varepsilon}}
& = (\mathbf{M}\mathbf{y})'\mathbf{M}\mathbf{y}\\
& = (\mathbf{M}(\mathbf{X}\boldsymbol{\beta}+\boldsymbol{\varepsilon}))'\mathbf{M}(\mathbf{X}\boldsymbol{\beta}+\boldsymbol{\varepsilon})\\
& = (\mathbf{M}\boldsymbol{\varepsilon})'\mathbf{M}\boldsymbol{\varepsilon}\\
& = \boldsymbol{\varepsilon}'\mathbf{M}\boldsymbol{\varepsilon}.
\end{align*}$$ First, we show that
$\mathbb{E}(\boldsymbol{\varepsilon}'\mathbf{M}\boldsymbol{\varepsilon}|\mathbf{X})=\sigma^2trace(\mathbf{M})$, second, we
show that $trace(\mathbf{M})=n-K$.\
1st Part: $$\begin{align*}
\boldsymbol{\varepsilon}'\mathbf{M}\boldsymbol{\varepsilon}
&=\sum_{i=1}^n\sum_{j=1}^n m_{ij}\varepsilon_i\varepsilon_j\quad(\text{All } m_{ij}\text{'s are functions of } \mathbf{X})\\[2ex]
\Rightarrow\mathbb{E}(\boldsymbol{\varepsilon}'\mathbf{M}\boldsymbol{\varepsilon}|\mathbf{X})
&=\sum_{i=1}^n\sum_{j=1}^n m_{ij}\mathbb{E}(\varepsilon_i\varepsilon_j|\mathbf{X})\\
&=\sum_{i=1}^n m_{ii}\sigma^2=\sigma^2trace(\mathbf{M}).
\end{align*}$$
2nd Part: $$\begin{align*}
trace(\mathbf{M})
&= trace(I_n-P) \\
&= trace(I_n)-trace(P)\quad(\text{By linearity of } trace(.))\\
&= n-trace(P)\\
&= n-trace(\mathbf{X}(\mathbf{X}'\mathbf{X})^{-1}\mathbf{X}')\\
&= n-trace(\mathbf{X}'\mathbf{X}(\mathbf{X}'\mathbf{X})^{-1})\\
&= n-trace(I_K)\\
&= n-K.
\end{align*}$$ Such that
$$\mathbb{E}(\hat{\boldsymbol{\varepsilon}}'\hat{\boldsymbol{\varepsilon}}|\mathbf{X})=\sigma^2(n-K).\quad\square$$ Remember
(trace-trick):

-   $trace(AB)=trace(BA)$
\EndKnitrBlock{proof}

### Hypothesis Testing under Normality {#Testing}

**Assumption 1.5: Normality**

$$
\begin{align*}
  \boldsymbol{\varepsilon}|\mathbf{X}\sim N(\mathbf{0},\sigma^2 \mathbf{I}_n)
\end{align*}
$$

Strictly, speaking, the only aspect of this assumption is that $\varepsilon$ is
normally distributed. The assumption immediately implies that

$$
\begin{align*}
  ((\mathbf{X}'\mathbf{X})^{-1}\mathbf{X}'\boldsymbol{\varepsilon})|\mathbf{X}\sim N(\mathbf{0},\sigma^2 (\mathbf{X}'\mathbf{X})^{-1}),
  (\mathbf{b}-\boldsymbol{\beta})|\mathbf{X}\sim N(\mathbf{0},\sigma^2 (\mathbf{X}'\mathbf{X})^{-1}),
\end{align*}
$$

which inspires our test statistics. E.g., if we would know $\sigma^2$,
we have

$$
\begin{align*}
  z_k=\frac{\text{b}_k-\bar{\beta}_k}{\left(\sigma^2\left[(\mathbf{X}'\mathbf{X})^{-1}\right]_{kk}\right)^{1/2}}\sim N(0,1),
\end{align*}
$$

where $\bar{\beta}_k$ is some known value specified by the null
hypothesis:

$\text{H}_0$: $\text{b}_k=\bar{\beta}_k$.


Usually, we do not know the value of $\sigma^2$ and have to estimate it.
In this case $\sigma^2$ is termed a **nuisance parameter**. Plugging in
the OLS estimate $s^2$ leads to

$$
\begin{align*}
  \text{t-ratio}_k=\frac{\text{b}_k-\bar{\beta}_k}{\left(s^2\left[(\mathbf{X}'\mathbf{X})^{-1}\right]_{kk}\right)^{1/2}}\sim t_{n-K},
\end{align*}
$$

where $t_{n-K}$ is the (Student) t-distribution with $n-K$ degrees of
freedom.\
Of course, **confidence intervals** for the single estimators
$\hat\beta_k$ can also be directly derived using the normality
assumption:

$$
\begin{align*}
  CI_{1-\alpha} = \left[\mathbf{b}_k\pm t_{1-\frac{\alpha}{2},n-K}\;s^2\sqrt{\left[(\mathbf{X}\mathbf{X})^{-1}\right]_{kk}}\right],
\end{align*}
$$

where $CI_{1-\alpha}$ contains the true unknown $\beta_k$ with
probability $1-\alpha$.\
Testing linear combinations of hypotheses (so-called **linear
restrictions**) on $\beta_1,\dots,\beta_K$:
$$\text{H}_0: \mathbf{R}\boldsymbol{\beta}=\mathbf{r},$$ where the
$(\#\mathbf{r}\times K)$ dimensional matrix $\mathbf{R}$ and the vector
$\mathbf{r}$ are known and specified by the hypothesis, and
$\#\mathbf{r}$ is the number of elements in $\mathbf{r}$ (i.e., the
number of linear equations in the nullhypothesis). To make sure that
there are no redundant equations it is required that
$rank(\mathbf{R})=\#\mathbf{r}$.\
Based on the normality assumption we can test the nullhypothesis using
the $\chi^2$-distributed test statistic

$$
\begin{align*}
  \text{W}=\frac{(\mathbf{R}\mathbf{b}-\mathbf{r})'(\mathbf{R}(\mathbf{X}'\mathbf{X})^{-1}\mathbf{R}')^{-1}(\mathbf{R}\mathbf{b}-\mathbf{r})}{\sigma^2}\sim \chi^2_{\#\mathbf{r}},
\end{align*}
$$

where $\chi^2_{\#\mathbf{r}}$ denotes the $\chi^2$-distribution with
$\#\mathbf{r}$ degrees of freedom. If $\sigma^2$ is unknown we have to
plug-in its estimator $s^2$, which then changes the distribution of the
test statistic:
$$
\begin{align*}
  \text{F}=\frac{(\mathbf{R}\mathbf{b}-\mathbf{r})'(\mathbf{R}(\mathbf{X}'\mathbf{X})^{-1}\mathbf{R}')^{-1}(\mathbf{R}\mathbf{b}-\mathbf{r})}{s^2 \#\mathbf{r}}\sim F_{\#\mathbf{r},n-K},
\end{align*}
$$

where $F_{\#\mathbf{r},n-K}$ is the $F$-distribution with
$\#\mathbf{r},n-K$ degrees of freedom.

### Asymptotics under the Classic Regression Model

In this section we proof that the OLS estimators $\mathbf{b}$ and $s^2$
applied to the classic regression model (defined by Assumptions 1.1 to
1.4) are consistent estimators as $n\to\infty$. Even better, we can show
that it is possible to drop the unrealistic normality assumption
(Assumption 1.5.), but still to use the usual test statistics as long as
the sample size $n$ is large. Though, before we can formally state the
asymptotic properties, we first need to adjust the rank assumption
(Assumption 1.3), such that the full column rank of $\mathbf{X}$ is guaranteed
for the limiting case as $n\to\infty$, too. Second, we need to assume
that the sample $(y_i,\mathbf{x}_i)$ is iid, which allows us to apply
Kolmogorov's strong LLN and Lindeberg-Levy's CLT.

**Assumption 1.3$^\ast$:**
$\mathbb{E}(\mathbf{x}_i\mathbf{x}_i')=\boldsymbol{\Sigma}_{\mathbf{x}\mathbf{x}},$\
such that the $(K\times K)$ matrix $\boldsymbol{\Sigma}_{\mathbf{x}\mathbf{x}}$ has
full rank $K$ (i.e., is nonsingular).\

**Assumption 1.5$^\ast$:** The sample $(\mathbf{x}_i,\varepsilon_i)$
(equivalently $(y_i,\mathbf{x}_i)$) is iid for all $i=1,\dots,n$, with
existing and finite first, second, third, and fourth moments.\


Note that existence and finiteness of the first two moments of
$\mathbf{x}_i$ is actually already implied by Assumption 1.3$^\ast$.\


Under the Assumptions 1.1, 1.2, 1.3$^\ast$, 1.4, and, 1.5$^\ast$ we can
show the following results.

**Proposition 3.1.8 (Consistency of $\mathbf{S}_{\mathbf{x}\mathbf{x}}^{-1}$)**

$$
\begin{align*}
\left( \frac{1}{n} \mathbf{X}'\mathbf{X} \right)^{-1} = \mathbf{S}_{\mathbf{x}\mathbf{x}}^{-1} \quad \overset{p} \longrightarrow \quad\boldsymbol{\Sigma}_{\mathbf{x}\mathbf{x}}^{-1}
\end{align*}
$$

\BeginKnitrBlock{proof}
\iffalse{} <span class="proof"><em>Proof. </em></span>  \fi{}1st Part: Let define $$\begin{align*}
[\mathbf{S}_{\mathbf{x}\mathbf{x}}]_{kl}&=\frac{1}{n}\sum_{i=1}^n\underbrace{x_{ik}x_{il}}_{z_{i,kl}}=\bar{z}_{kl}.\end{align*}$$

From: $$\begin{array}{ll}
\mathbb{E}[z_{i,kl}]=[\mathbf{S}_{\mathbf{x}\mathbf{x}}]_{kl}&\quad\text{(By Assumption 1.3}^\ast)\\
\text{and}&\\
z_{i,kl}\quad\text{is iid and has four moments}      &\quad\text{(By Assumption 1.5}^\ast)
\end{array}$$ it follows by [Kolmogorov's strong law of large numbers](https://www.statlect.com/asymptotic-theory/law-of-large-numbers)
that $$\begin{align*}
\bar{z}_{kl}\overset{a.s.}\longrightarrow \left[\boldsymbol{\Sigma}_{\mathbf{x}\mathbf{x}}\right]_{kl},\quad\text{for any}\quad 1\leq k,l\leq K.
\end{align*}$$
Consequently,
$\mathbf{S}_{\mathbf{x}\mathbf{x}}\overset{a.s.}\longrightarrow\boldsymbol{\Sigma}_{\mathbf{x}\mathbf{x}}$
element-wise.\
2nd Part: By the [Continuous Mapping Theorem](https://www.statlect.com/asymptotic-theory/continuous-mapping-theorem)
we have that also $$\begin{align*}
\left(\mathbf{S}_{\mathbf{x}\mathbf{x}}\right)^{-1}\overset{a.s.}\longrightarrow\left(\boldsymbol{\Sigma}_{\mathbf{x}\mathbf{x}}\right)^{-1}.
\end{align*}$$
3rd Part: Almost-Sure-Convergence implies Convergence-in-Probability
($\overset{a.s.}\longrightarrow \, \Rightarrow \, \overset{p}\longrightarrow$); see [relations among modes of convergence](https://www.statlect.com/asymptotic-theory/relations-among-modes-of-convergence).
\EndKnitrBlock{proof}

**Proposition 3.1.9 (Consistency of $\mathbf{b}$)**
$$\mathbf{b}\overset{p}\longrightarrow\boldsymbol{\beta}$$

\BeginKnitrBlock{proof}
\iffalse{} <span class="proof"><em>Proof. </em></span>  \fi{}: We show the equivalent result that
$\mathbf{b}-\boldsymbol{\beta}\overset{p}\longrightarrow \mathbf{0}$.\
Remember: $$\begin{align*}
\mathbf{b}-\boldsymbol{\beta}
&=(\mathbf{X}'\mathbf{X})^{-1}\mathbf{X}'\boldsymbol{\varepsilon}\\
&=(n^{-1}\mathbf{X}'\mathbf{X})^{-1}\frac{1}{n}\mathbf{X}'\boldsymbol{\varepsilon}\\
&=\left(\mathbf{S}_{\mathbf{x}\mathbf{x}}\right)^{-1}\;\frac{1}{n}\sum_{i=1}^n\mathbf{x}_i\varepsilon_i\end{align*}$$
From propositions 3.1.8: $\left(\mathbf{S}_{\mathbf{x}\mathbf{x}}\right)^{-1}\overset{p}\longrightarrow\left(\boldsymbol{\Sigma}_{\mathbf{x}\mathbf{x}}\right)^{-1}$.\
Let us focus on element-by-element asymptotics of
$\frac{1}{n}\sum_{i=1}^n\mathbf{x}_i\varepsilon_i$:\
Define $$\begin{align*}
\frac{1}{n}\sum_{i=1}^n\underbrace{x_{ik}\varepsilon_i}_{z_{ik}}=\bar{z}_{n,k}.\end{align*}$$
From: $$\begin{array}{ll}
\mathbb{E}[z_{ik}]=\mathbb{E}[x_{ik}\varepsilon_i]=0&\quad\text{(By Str.~Exog.~Ass 1.2)}\\
\text{and}&\\
z_{ik}\quad\text{is iid and has four moments}      &\quad\text{(By Assumption 1.5$^\ast$)}
\end{array}$$ it follows by [Kolmogorov's strong law of large numbers](https://www.statlect.com/asymptotic-theory/law-of-large-numbers)
that $$\begin{align*}
\bar{z}_{n,k}=\sum_{i=1}^nx_{ik}\varepsilon_i&\overset{a.s.}\longrightarrow 0\quad\text{for any}\quad 1\leq k\leq K.\end{align*}$$
Consequently, also $$\begin{align*}
\frac{1}{n}\sum_{i=1}^n\mathbf{x}_i\varepsilon_i&\overset{a.s.}\longrightarrow\underset{(K\times 1)}{\mathbf{0}}
\quad(\text{element-wise}).\end{align*}$$ Almost-Sure-Convergence
implies Convergence-in-Probability ($\overset{a.s.}\longrightarrow \Rightarrow\overset{p}\longrightarrow$); see [relations among modes of convergence](https://www.statlect.com/asymptotic-theory/relations-among-modes-of-convergence):
$$\begin{align*}
\frac{1}{n}\sum_{i=1}^n\mathbf{x}_i\varepsilon_i&\overset{p}\longrightarrow\underset{(K\times 1)}{\mathbf{0}}
\quad(\text{element-wise}).\end{align*}$$ Final step: From
$$\begin{align*}
&\left(\mathbf{S}_{\mathbf{x}\mathbf{x}}\right)^{-1}\overset{p}\longrightarrow\left(\boldsymbol{\Sigma}_{\mathbf{x}\mathbf{x}}\right)^{-1}\\
&\text{and}\\
&\frac{1}{n}\sum_{i=1}^n\mathbf{x}_i\varepsilon_i\overset{p}\longrightarrow\mathbf{0}\end{align*}$$
it follows by [Slutsky's Theorem](https://www.statlect.com/asymptotic-theory/Slutsky-theorem)
that
\begin{align*}
\mathbf{b}-\boldsymbol{\beta}
&=\left(\mathbf{S}_{\mathbf{x}\mathbf{x}}\right)^{-1}\;\frac{1}{n}\sum_{i=1}^n\mathbf{x}_i\varepsilon_i\overset{p}\longrightarrow \mathbf{0}.
\end{align*}
\EndKnitrBlock{proof}

Furthermore, we can show that the appropriately scaled (by $\sqrt{n}$)
sampling error $\mathbf{b}-\boldsymbol{\beta}$ of the OLS estimator is asymptotically
normal distributed.

**Proposition 3.1.10 (Sampling error limiting normality)**
$$\sqrt{n}(\mathbf{b}-\boldsymbol{\beta})\overset{d}\longrightarrow N(\mathbf{0},\sigma^2 \boldsymbol{\Sigma}^{-1}_{\mathbf{x}\mathbf{x}}).$$

In order to show Proposition 3.1.10, we will need to use the so-called Cramér
Wold Device on multivariate convergence in distribution:\

**Cramér Wold Device:** Let $\mathbf{z}_n,\mathbf{z}\in\mathbf{R}^K$,
then\
$$\mathbf{z}_n\overset{d}\longrightarrow \mathbf{z} \quad \text{if and only if} \quad \boldsymbol{\lambda}'\mathbf{z}_n\overset{d}\longrightarrow \boldsymbol{\lambda}'\mathbf{z}$$
for any $\boldsymbol{\lambda}\in\mathbb{R}^K$.

The Cramér Wold Device is needed, since $\mathbf{z}_n\overset{d}\longrightarrow \mathbf{z}$
implies convergence in distribution element-by-element, **but**
convergence in distribution element-by-element does not imply
$\mathbf{z}_n\overset{d}\longrightarrow \mathbf{z}$.

\BeginKnitrBlock{proof}
\iffalse{} <span class="proof"><em>Proof. </em></span>  \fi{}Let's start with some rearrangements: $$\begin{align*}
\mathbf{b}-\boldsymbol{\beta}
&=(\mathbf{X}'\mathbf{X})^{-1}\mathbf{X}'\boldsymbol{\varepsilon}\\
&=(n^{-1}\mathbf{X}'\mathbf{X})^{-1}\frac{1}{n}\mathbf{X}'\boldsymbol{\varepsilon}\\
&=\left(\mathbf{S}_{\mathbf{x}\mathbf{x}}\right)^{-1}\;\frac{1}{n}\sum_{i=1}^n\mathbf{x}_i\varepsilon_i\\
\Leftrightarrow\sqrt{n}(\mathbf{b}-\boldsymbol{\beta})&=\left(\mathbf{S}_{\mathbf{x}\mathbf{x}}\right)^{-1}\;\left(\sqrt{n}\frac{1}{n}\sum_{i=1}^n\mathbf{x}_i\varepsilon_i\right)\end{align*}$$

>From Proposition 3.1.8, we already know that
$$\left(\frac{1}{n}\mathbf{X}'\mathbf{X}\right)^{-1}=\mathbf{S}_{\mathbf{x}\mathbf{x}}^{-1}\quad\overset{p}\longrightarrow \quad\boldsymbol{\Sigma}_{\mathbf{x}\mathbf{x}}^{-1}.$$

What happens with $$\begin{align*}
\sqrt{n}\underbrace{\frac{1}{n}\sum_{i=1}^n\overbrace{\mathbf{x}_i\varepsilon_i}^{\mathbf{z}_i}}_{\bar{\mathbf{z}}_n}=\sqrt{n}\,\bar{\mathbf{z}}_n\quad ?\end{align*}$$
In the following we show that
$\sqrt{n}\,\bar{\mathbf{z}}_n\overset{d}\longrightarrow N(\mathbf{0},\sigma^2\,\boldsymbol{\Sigma}_{\mathbf{x}\mathbf{x}})$
using the Cramér Wold Device:\
1st Moment: $$\begin{align*}
\mathbb{E}(\boldsymbol{\lambda}'\mathbf{z}_i)&=
\boldsymbol{\lambda}'\;\underset{\text{(By Str.~Exog.~Ass 1.2)}}{\underbrace{\left(\begin{matrix}\mathbb{E}(\mathbf{x}_{i1}\varepsilon_i)\\\vdots\\\mathbb{E}(\mathbf{x}_{iK}\varepsilon_i)\end{matrix}\right)}_{\mathbf{0}}}=\boldsymbol{\lambda}'\mathbf{0}=0,\end{align*}$$
for any $\boldsymbol{\lambda}\in\mathbb{R}^{K}$ and for all
$i=1,2,\dots$\
2nd Moment: $$\begin{align*}
\mathbb{V}(\boldsymbol{\lambda}'\mathbf{z}_i)
&=\boldsymbol{\lambda}'\mathbb{V}(\mathbf{z}_i)\boldsymbol{\lambda}\\
&=\boldsymbol{\lambda}'\mathbb{E}(\varepsilon_i\mathbf{x}_i\mathbf{x}_i')\boldsymbol{\lambda}\\
&=\boldsymbol{\lambda}'\mathbb{E}(\mathbb{E}(\varepsilon_i\mathbf{x}_i\mathbf{x}_i'|\mathbf{X}))\boldsymbol{\lambda}\\
&=\boldsymbol{\lambda}'\mathbb{E}(\mathbf{x}_i\mathbf{x}_i'\underset{\text{(Ass 1.4)}}{\underbrace{\mathbb{E}(\varepsilon_i|\mathbf{X})}_{=\sigma^2}})\boldsymbol{\lambda}\\
&=\boldsymbol{\lambda}'\sigma^2\underset{\text{(Ass $1.3^\ast$)}}{\underbrace{\mathbb{E}(\mathbf{x}_i\mathbf{x}_i')}_{\boldsymbol{\Sigma}_{\mathbf{x}\mathbf{x}}}}\boldsymbol{\lambda}=\sigma^2\boldsymbol{\lambda}'\boldsymbol{\Sigma}_{\mathbf{x}\mathbf{x}}\boldsymbol{\lambda},\end{align*}$$
for any $\boldsymbol{\lambda}\in\mathbb{R}^{K}$ and for all
$i=1,2,\dots$\
From $\mathbb{E}(\boldsymbol{\lambda}'\mathbf{z}_i)=0$,
$\mathbb{V}(\boldsymbol{\lambda}'\mathbf{z}_i)=\sigma^2\boldsymbol{\lambda}'\boldsymbol{\Sigma}_{\mathbf{x}\mathbf{x}}\boldsymbol{\lambda}$,
and $\mathbf{z}_i=(\mathbf{x}_i\varepsilon_i)$ being iid (Ass
$1.5^\ast$), it follows by the [Lindeberg-Levy's CLT](https://www.statlect.com/asymptotic-theory/central-limit-theorem)
and the Cramér Wold Device that $$\begin{align*}
\sqrt{n}\boldsymbol{\lambda}'\bar{\mathbf{z}}_n&\overset{d}\longrightarrow N(0,\sigma^2\boldsymbol{\lambda}'\boldsymbol{\Sigma}_{\mathbf{x}\mathbf{x}}\boldsymbol{\lambda})\quad\text{(By Lindeberg-Levy's CLT)}\\
\Leftrightarrow
\underbrace{\sqrt{n}\bar{\mathbf{z}}_n}_{=\sqrt{n}\frac{1}{n}\sum_{i=1}^n\mathbf{x}_i\varepsilon_i}&\overset{d}\longrightarrow N(\mathbf{0},\sigma^2\boldsymbol{\Sigma}_{\mathbf{x}\mathbf{x}})\quad\text{(Cramér Wold Device)}\end{align*}$$

Now, we can conclude the proof:\
From
$\mathbf{S}_{\mathbf{x}\mathbf{x}}^{-1}\quad\overset{p}\longrightarrow \quad\boldsymbol{\Sigma}_{\mathbf{x}\mathbf{x}}^{-1}$
(by Proposition 3.1.8 and\
$\sqrt{n}\frac{1}{n}\sum_{i=1}^n\mathbf{x}_i\varepsilon_i\overset{d}\longrightarrow N(\mathbf{0},\sigma^2\boldsymbol{\Sigma}_{\mathbf{x}\mathbf{x}})$
it follows by [Slutsky's Theorem](https://www.statlect.com/asymptotic-theory/Slutsky-theorem)
that

\begin{align*}
\underbrace{\left(\mathbf{S}_{\mathbf{x}\mathbf{x}}\right)^{-1}\;\left(\sqrt{n}\frac{1}{n}\sum_{i=1}^n\mathbf{x}_i\varepsilon_i\right)}_{\sqrt{n}(\mathbf{b}-\boldsymbol{\beta})}\overset{d}\longrightarrow N\left(\mathbf{0},\underbrace{(\boldsymbol{\Sigma}_{\mathbf{x}\mathbf{x}}^{-1})\,(\sigma^2\boldsymbol{\Sigma}_{\mathbf{x}\mathbf{x}})\,(\boldsymbol{\Sigma}_{\mathbf{x}\mathbf{x}}^{-1})'}_{\sigma^2\boldsymbol{\Sigma}_{\mathbf{x}\mathbf{x}}}\right)
\end{align*}
\EndKnitrBlock{proof}
