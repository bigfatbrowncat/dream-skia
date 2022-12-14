#if 0  // Disabled until updated to use current API.
// Copyright 2019 Google LLC.
// Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.
#include "tools/fiddle/examples.h"
// HASH=ac49e8b810bd6ed5d84b4f5a3b40a0ec
REG_FIDDLE(Path_Convexity, 256, 256, false, 0) {
void draw(SkCanvas* canvas) {
    SkPaint paint;
    SkPoint quad[] = {{70, 70}, {20, 20}, {120, 20}, {120, 120}};
    const char* labels[] = { "unknown", "convex", "concave" };
    for (SkScalar x : { 40, 100 } ) {
        SkPath path;
        quad[0].fX = x;
        path.addPoly(quad, std::size(quad), true);
        canvas->drawPath(path, paint);
        canvas->drawString(labels[(int) path.getConvexity()], 30, 100, paint);
        canvas->translate(100, 100);
    }
}
}  // END FIDDLE
#endif  // Disabled until updated to use current API.
