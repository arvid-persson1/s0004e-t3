#set heading(numbering: "1a.")

=

==

$
#{
  let x(n) = if n < 0 {
    0
  } else if n < 3 {
    n + 1
  } else if n < 5 {
    5 - n
  } else {
    1
  }

  let y(n) = 2 * x(n) - 3 * x(n - 1) + 2 * x(n - 2)

  for n in range(0, 6) {
    $y[#n] &= #y(n) quad$
  }
  [\ ]
  for n in range(6, 11) {
    $y[#n] &= #y(n) quad$
  }
}
$

==

#figure(
  image("images/x.png"),
  caption: "Input signal",
)

#figure(
  image("images/y.png"),
  caption: "Output signal",
)

==

Looking at the definition of $y$, it follows trivially that

$
h[n] = 2delta[n] - 3delta[n - 1] + 2delta[n - 2].
$

#figure(
  image("images/h.png"),
  caption: "Impulse response",
)

=

Define $S: x |-> y$.

==

$
   &S(a x_1[n] + b x_2[n]) \
 = &(a x_1[n] + b x_2[n]) cos(0.2pi n) \
 = &a x_1[n] cos(0.2pi n) + b x_2[n] cos(0.2pi n) \
 = &S(a x_1[n]) + S(b x_2[n])
$

$
   &S(x[n - n_0]) \
 = &x[n - n_0]) cos(0.2pi n) \
!= &x[n - n_0]) cos(0.2pi (n - n_0)) \
 = &y[n - n_0]
$

We see that the system is *linear*, *time-variant* and *causal*, as it is not a
function of any future inputs.

==

$
   &S(a x_1[n] + b x_2[n]) \
 = &(a x_1[n] + b x_2[n]) - (a x_1[n - 1] + b x_2[n - 1]) \
 = &a(x_1[n] - x_1[n - 1]) + b(x_2[n] - x_2[n - 1]) \
 = &S(a x_1[n]) + S(b x_2[n])
$

$
   &S(x[n - n_0]) \
 = &x[n - n_0] - x[n - n_0 - 1] \
 = &y[n - n_0]
$

We see that the system is *linear*, *time-invariant* and *causal*, as it is not
a function of any future inputs.

==

$
   &S(a x_1[n] + b x_2[n]) \
 = &|a x_1[n] + b x_2[n]| \
!= &|a x_1[n]| + |b x_2[n]| \
 = &S(a x_1[n]) + S(b x_2[n])
$

$
   &S(x[n - n_0]) \
 = &|x[n - n_0])| \
 = &y[n - n_0]
$

We see that the system is *nonlinear*, *time-invariant* and *causal*, as it is
not a function of any future inputs.

==

$
   &S(a x_1[n] + b x_2[n]) \
 = &A(a x_1[n] + b x_2[n]) + B \
!= &(A a x_1[n] + B) + (A b x_2[n] + B) \
 = &S(a x_1[n]) + S(b x_2[n])
$

$
   &S(x[n - n_0]) \
 = &A x[n - n_0] + B \
 = &y[n - n_0]
$

We see that the system is *nonlinear*, *time-invariant* and *causal*, as it is
not a function of any future inputs.

=

==

$
h_1[n] &= delta[n] + delta[n - 1] \
h_2[n] &= delta[n] - delta[n - 2] \
h_3[n] &= delta[n - 1] - delta[n - 2]
$

==

$
h[n] &= h_1[n] * h_2[n] * h_3[n] \
     &= ((delta[n] + delta[n - 1]) * (delta[n] - delta[n - 2])) * h_3[n] \
     &= (delta[n] * (delta[n] - delta[n - 2]) + delta[n - 1] * (delta[n] - delta[n - 2])) * h_3[n] \
     &= (delta[n] - delta[n - 2] + delta[n - 1] - delta[n - 3]) * h_3[n] \
     &= ... \
     &= delta[n - 1] - 2delta[n - 3] + delta[n - 5]
$

==

$
y[n] = x[n - 1] - 2x[n - 3] + x[n - 5]
$

=

==

$
y[n] &= sum_(k = 0)^2 b_k x[n - k] \
     &= 13x[n] - 13x[n - 1] + 13x[n - 2] \
     &= 2 dot.op 13x[n] - 13x[n - 1] \
     &= cases(-13 &"for" n "even", 26 &"for" n "odd")
$

==

#figure(
  image("images/diag.svg"),
  caption: "Direct form block diagram.",
)

=

==

$
     &h[n] &=& delta[n - 2] \
<==> &y[n] &=& x[n - 2] \
<==> &x[n] &=& y[n + 2] \
     &     &=& u[n - 1] - u[n - 4] \
     &     &=& cases(1 &"for" 1 <= n <= 3, 0 &"otherwise")
$ 

==

$
     &y[n] &=& x[n] * h[n] \
     &     &=& x[n] * (delta[n] - delta[n - 1]) \
     &     &=& x[n] - x[n - 1] \
     &     &=& delta[n] - delta[n - 4] \
<==> &x[n] &=& u[n] - u[n - 4] \
     &     &=& cases(1 &"for" 0 <= n <= 3, 0 &"otherwise")
$

=

Define $S: x |-> y$.

$
y_2[n] &= S(x_2[n]) \
       &= S(3u[n]) - S(2u[n - 4]) quad & "by additivity" \
       &= 3S(u[n]) - 2S(u[n - 4]) quad & "by homogeneity" \
       &= 3y_1[n] - 2y_1[n - 4]   quad & "by time-invariance" \
       &= 3delta[n] + 6delta[n - 1] - 3delta[n - 2] - 2delta[n - 4] - 4delta[n - 5] + 2delta[n - 6]
$
