x = 0:0.01:5*pi;

const dc4 = [0.08333333333333333, -0.6666666666666666, 0.6666666666666666, -0.08333333333333333]
const c1dd4 = [2.0833333333333335, 4.0, -3.0, 1.3333333333333333, -0.25]
const c2dd4 = [-0.25, -0.08333333333333333, 1.5, -0.5, 0.08333333333333333]
const d1dd4 = [0.25, -1.3333333333333333, 3.0, -4.0, -2.0833333333333335]
const d2dd4 = [-0.08333333333333333, 0.5, -1.5, 0.08333333333333333, 0.25]

function prime(α)
    n = length(α);
    x = zeros(n);
    x[2] = 1;
    A = α'.^(0:n-1);
    β = A\x;
    nth = (α'.^n)*β;
    if abs(nth[1]) < 100*eps(Float64)
        nth = (α'.^(n+1))*β;
        γ = factorial(n+1)/nth;
        ϵ = n;
    else
        γ = factorial(n)/nth;
        ϵ = n-1;
    end
    β, ϵ, γ

end

function tdiff(h::Number, y)
    y′ = [dc4'y[[i-2,i-1,i+1,i+2]] for i = 3:length(y)-2]
    """
    y′= zeros(length(x));
    y′[1] = c1dd4'y[1:5];
    y′[2] = c2dd4'y[1:5];
    y′[end] = d1dd4'y[end-4:end];
    y′[end-1] = d2dd4'y[end-4:end];
    for i = 3:length(y)-2
        y′[i] = dc4'y[[i-2,i-1,i+1,i+2]];
    end"""
    y′/h
end


println(prime([-2,-1,0,1]));
