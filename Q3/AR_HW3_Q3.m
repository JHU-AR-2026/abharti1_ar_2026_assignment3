% Q3 Implementation


[u,v] = pixelCoords(800, 600, 0.2, 20, 800, 800, 400, 400, [0.3;-0.15;-6;1])

function[u, v] = pixelCoords(W, H, n, f, fy, fx, ox, oy, pc)

    projectionMatrix = [(2 * fx) / W, 0, (W - 2 * ox) / W, 0;
        0, (2 * fy) / H, (-H + 2 * oy) / H, 0;
        0, 0, -(f + n) / (f - n), -(2 * f * n) / (f - n);
        0, 0, -1, 0];
    
    pClip = projectionMatrix * pc;
    
    pNDC = pClip(1:3) / pClip(4);
    
    u = 0.5 * (pNDC(1) + 1) * W;
    v = 0.5 * (pNDC(2) + 1) * H;

end