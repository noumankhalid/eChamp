$(document).ready(function() {
    $('#slider1')
            .anythingSlider({
                                width          : 960,
                                height         : 393,
                                startStopped   : true,
                                toggleControls : true,
                                theme          : 'metallic',
                                navigationFormatter : function(i, panel) {
                                    //return '<img src="/images/th-slide-' + ['civil-1', 'env-1', 'civil-2', 'env-2'][i - 1] + '.jpg">';
                                }
                            })
            .find('.panel:not(.cloned) img')// ignore the cloned panels
            .attr('rel', 'group')// add all slider images to a colorbox group
            .colorbox({
                          width: '90%',
                          height: '90%',
                          href: function() {
                              return $(this).attr('src');
                          },
                          // use $(this).attr('title') for specific image captions
                          title: 'Press escape to close',
                          rel: 'group'
                      });
});