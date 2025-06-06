%%% Copyright (c) Meta Platforms, Inc. and affiliates. All rights reserved.
%%%
%%% This source code is licensed under the Apache 2.0 license found in
%%% the LICENSE file in the root directory of this source tree.

-module(uncovered_clauses).

-compile([export_all, nowarn_export_all]).

-spec uncovered_1(ok) -> ok.
uncovered_1(A) when A == a -> A;
uncovered_1(A) -> A.

-spec uncovered_2(term(), {ok, atom()}) -> ok.
uncovered_2(_, {a, A}) -> A;
uncovered_2(_, _) -> ok.

-spec uncovered_3({ok, atom()}) -> ok.
uncovered_3({ok, _A}) -> ok;
uncovered_3({ok, A}) -> A;
uncovered_3(_) -> ok.

-spec uncovered_4_no_err(ok) -> ok.
uncovered_4_no_err(V) -> V;
uncovered_4_no_err(_) -> ok.

-spec uncovered_5({ok, atom()}) -> ok.
uncovered_5({err, _A}) -> ok;
uncovered_5(_) -> ok.

-spec uncovered_6(#{atom() => atom()}) -> ok.
uncovered_6(#{a := V}) when is_integer(V) -> V;
uncovered_6(_) -> ok.

-spec uncovered_number(number() | ok) -> ok.
uncovered_number(I) when is_integer(I) -> ok;
uncovered_number(F) when is_float(F) -> ok;
uncovered_number(A) -> A.

-spec uncovered_number_2(number() | ok) -> ok.
uncovered_number_2(F) when is_float(F) -> ok;
uncovered_number_2(I) when is_integer(I) -> ok;
uncovered_number_2(A) -> A.

-spec uncovered_single(#{a => atom()}) -> atom().
uncovered_single(#{a_typo := A}) -> A.
-spec uncovered_last_1(atom()) -> ok.
uncovered_last_1(A) when is_atom(A) -> ok;
uncovered_last_1(A) when is_integer(A) -> ok.

-spec uncovered_last_2(atom()) -> ok.
uncovered_last_2(A) when is_atom(A) -> ok;
uncovered_last_2(A) -> ok.

-spec uncovered_last_3({ok, atom()}) -> ok.
uncovered_last_3({ok, _A}) -> ok;
uncovered_last_3({err, _A}) -> ok.

-spec uncovered_last_4({ok, atom()}) -> ok.
uncovered_last_4({ok, _A}) -> ok;
uncovered_last_4(_) -> ok.
