shader_type spatial;
render_mode unshaded;
uniform float outline_width = 2.0;
uniform vec4 outline_color: hint_color;
uniform sampler2D tex: hint_albedo;
uniform vec2 pixelSize = vec2(.01, .01);

void fragment(){
    vec4 col = texture(tex, UV);
    vec2 ps = pixelSize * outline_width;
    float a;
    float maxa = col.a;
    float mina = col.a;


    for(float x = -1.0; x <= 1.0; x+=0.05) {
        float y = 1.0 - (x*x);
        if(vec2(x,y) == vec2(0.0)) {
            continue; // ignore the center of kernel
        }

        a = texture(tex, clamp(UV + vec2(x,y)*ps, vec2(0,0), vec2(1,1))).a;
        maxa = max(a, maxa); 
        mina = min(a, mina);
    }

    for(float x = -1.0; x <= 1.0; x+=0.05) {
        float y = -1.0 + (x*x);
        if(vec2(x,y) == vec2(0.0)) {
            continue; // ignore the center of kernel
        }

        a = texture(tex, clamp(UV + vec2(x,y)*ps, vec2(0,0), vec2(1,1))).a;
        maxa = max(a, maxa); 
        mina = min(a, mina);
    }


    // Fill transparent pixels only, don't overlap texture
    if(col.a < 0.95) {
		vec4 output = mix(col, outline_color, maxa-mina);
        ALBEDO = output.rgb;
		ALPHA = output.a;
    } else {
        ALBEDO = col.rgb;
		ALPHA = col.a;
    }
}