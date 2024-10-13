## Copyright (C) 2021 Andrei
##
## This program is free software: you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <https://www.gnu.org/licenses/>.

## -*- texinfo -*-
## @deftypefn {} {@var{retval} =} KNN (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Andrei <Andrei@DESKTOP-PK505U9>
## Created: 2021-08-09

function prediction = KNN(labels, Y, test, k)
    % Initializează prediction.
    prediction = -1;
    
    % Initializează distanțele.
    [m, n] = size(Y);
    distance = zeros(m, 1);
    
    % Pentru fiecare rând, calculăm distanța Euclidiană dintre acesta și vectorul de test.
    for i = 1:m
        distance(i) = norm(Y(i,:) - test);
    end
    
    % Ordonăm crescător distanțele și păstrăm într-un vector primele k valori care reprezintă
    % valorile etichetelor acestor imagini care s-au dovedit a fi cele mai apropiate.
    [~, indices] = sort(distance);
    k_labels = labels(indices(1:k));
    
    % Calculăm predicția ca mediana celor k valori cele mai apropiate.
    prediction = mode(k_labels);
end

