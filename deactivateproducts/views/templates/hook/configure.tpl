<div class="row" style="margin-top: 40px;">
  <div class="col-md-12 bootstrap">
      <div class="bootstrap">
        <div class="module_confirmation conf confirm alert alert-success">
          {l s='Gracias a tu colaboración seguiremos desarrollando nuevos módulos y dando soporte a los existentes.' mod='deactivateproducts'}
        </div>
      </div> 

  	  <div class="bootstrap">
  	  	<div class="module_confirmation conf confirm alert alert-success">
  	  		{l s='Puedes colaborar para ayudar al desarollador.' mod='deactivateproducts'} <a href="https://paypal.me/deltovar?locale.x=es_XC" target="_blank"> Paypal</a>
  	  	</div>
  	  </div>

      <div class="bootstrap">
        <div class="module_confirmation conf confirm alert alert-success">
          {l s='Contactame para dudas, mejoras o contrataciones.' mod='deactivateproducts'} <a href="mailto:trabajoremotodt@gmail.com"> Aqui </a>
        </div>
      </div>
      <div class="bootstrap">
        <button id="desactivarI" class="btn btn-primary" name="desactivar">
          <i class="icon-AdminAdmin"></i> {l s='Desactivar Productos Sin Imagenes' mod='deactivateproducts'} 
        </button>
        <button id="desactivarS" class="btn btn-primary" name="desactivar">
          <i class="icon-AdminAdmin"></i> {l s='Desactivar Productos Sin Stock' mod='deactivateproducts'} 
        </button>
      </div>
      <br>
      <div class="resultado"></div>

  </div>
</div>

<script type="text/javascript">
{literal}
  $('document').ready(function(){
  
    $('#desactivarI').click(function(){
      ajaxDelvis(1);
    });

    $('#desactivarS').click(function(){
      ajaxDelvis(2);
    });

    function ajaxDelvis(caso) {
      $.ajax({
        {/literal}url: "{$module_dir}desactivarProductos.php",{literal}
        data: {"caso" : caso},
        async:true,
        type: "POST",
        beforeSend: function() {
          var imgD = {/literal}"{$module_dir}/images/cargando.gif"{literal};
          $("#desactivar").html("<img src='" + imgD + "' style='height:30px;'>");
        }
      })
      .done(function( data, textStatus, jqXHR ) {
          if ( console && console.log ) {
            $("#desactivar").html("<i class='icon-AdminAdmin'></i> Desactivar Productos");
            $(".resultado").html('<div class="module_confirmation conf confirm alert alert-success"> Se Desactivaron '+ data +' productos </div></div>');
          }
      })
      .fail(function( jqXHR, textStatus, errorThrown ) {
          if ( console && console.log ) {
              $(".resultado").html('<div class="module_confirmation conf confirm alert alert-success"> Hubo un error contacte, intente mas tarde </div></div>');
          }
      });
    }
    
  });
{/literal}
</script>