<simple-bar class="comparison-charts__bar comparison-charts__bar--{ opts.modifier }"
  style="width:{ opts._value * 2 }%;background-color:{ opts.color }">
  <span class="comparison-charts__bar-label">{ opts._value }&nbsp;%</span>
  <span class="comparison-charts__bar-group-label">{ opts.label }</span>
</simple-bar>


<comparison-charts class="comparison-charts__container">

  <div class="comparison-charts__chart">
    <div each={ item in opts.data } class="comparison-charts__bar-group">
      <span class="comparison-charts__bar-group-title">{ item.label }</span>
      <simple-bar if={ item.value1 } label={ parent.opts.label1 }
        modifier="main" _value={ item.value1 } color={ item.color } />
      <simple-bar if={ item.value2 } label={ parent.opts.label2 }
        modifier="second" _value={ item.value2 } color={ item.color } />
    </div>
  </div>

</comparison-charts>
