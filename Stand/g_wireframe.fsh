uniform highp mat4 viewMatrix;

uniform highp vec3 lightPosition;
uniform highp vec3 lightIntensity;

uniform highp vec3 ka;            // Ambient reflectivity
uniform highp vec3 ks;            // Specular reflectivity
uniform highp float shininess;    // Specular shininess factor
uniform highp float opacity;      // Alpha channel

uniform sampler2D diffuseTexture;

varying highp vec4 positionInLightSpace;

varying highp vec3 position;
varying highp vec3 normal;
varying highp vec2 texCoord;

highp vec3 dModel(const highp vec2 flipYTexCoord)
{
    // Calculate the vector from the light to the fragment
    highp vec3 s = normalize(vec3(viewMatrix * vec4(lightPosition, 1.0)) - position);

    // Calculate the vector from the fragment to the eye position
    // (origin since this is in "eye" or "camera" space)
    highp vec3 v = normalize(-position);

    // Reflect the light beam using the normal at this fragment
    highp vec3 r = reflect(-s, normal);

    // Calculate the diffuse component
    highp float diffuse = max(dot(s, normal), 0.0);

    // Calculate the specular component
    highp float specular = 0.0;
    if (dot(s, normal) > 0.0)
        specular = (shininess / (8.0 * 3.14)) * pow(max(dot(r, v), 0.0), shininess);

    // Lookup diffuse and specular factors
    highp vec3 diffuseColor = texture2D(diffuseTexture, flipYTexCoord).rgb;

    // Combine the ambient, diffuse and specular contributions
    return lightIntensity * ((ka + diffuse) * diffuseColor + specular * ks);
}

void main()
{
    highp vec2 flipYTexCoord = texCoord;
    flipYTexCoord.y = 1.0 - texCoord.y;

    highp vec3 result = dModel(flipYTexCoord);

    highp float alpha = opacity * texture2D(diffuseTexture, flipYTexCoord).a;

    gl_FragColor = vec4(result, alpha);
}

