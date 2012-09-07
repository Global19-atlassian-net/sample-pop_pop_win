#library('sweeper-canvas');

#import('dart:html');
#import('dart:math');
#import('package:dartlib/lib/dartlib.dart', prefix:'dartlib');
#import('package:dartlib/lib/html.dart');
#import('package:dartlib/lib/retained.dart');
#import('sweeper.dart');
#import('html.dart');

#source('canvas/game_root.dart');
#source('canvas/game_element.dart');
#source('canvas/square_element.dart');
#source('canvas/image_loader.dart');

#source('texture/texture_input.dart');

Map<String, TextureInput> _textures;
ImageElement _textureImage;

void populateTextures(Map<String, TextureInput> textures) {
  assert(_textures == null);
  assert(textures != null);
  _textures = textures;
}

void populateTextureImage(ImageElement imageElement) {
  assert(imageElement != null);
  assert(_textureImage == null);
  _textureImage = imageElement;
}

TextureInput getTexture(String key) {
  assert(_textures != null);
  return _textures[key];
}

void drawTextureKeyAt(CanvasRenderingContext2D ctx, String textureKey,
                   dartlib.Coordinate location) {
  assert(_textureImage != null);
  assert(textureKey != null);
  final texture = getTexture(textureKey);
  assert(texture != null);
  drawTextureAt(ctx, location, texture, _textureImage);
}

void drawTextureAt(CanvasRenderingContext2D ctx, dartlib.Coordinate location,
                    TextureInput texture, ImageElement imageElement) {
  ctx.save();
  final tx = new dartlib.AffineTransform();
  tx.translate(location.x, location.y);

  var theFrame = texture.frame;
  var offset = texture.offset;
  tx.translate(offset.x, offset.y);

  if(texture.rotated) {
    tx.rotate(-PI/2.0, 0, 0);
    theFrame = new dartlib.Rect(theFrame.left, theFrame.top,
        theFrame.height, theFrame.width);
  }

  final imgSize = theFrame.size.toVector().scale(-0.5);
  tx.translate(imgSize.x, imgSize.y);

  CanvasUtil.transform(ctx, tx);

  CanvasUtil.drawImage(ctx, imageElement, theFrame);
  ctx.restore();
}
