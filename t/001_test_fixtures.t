use Test::Mini::Unit;

testcase Fixtures
{
    test Simple
    {
        require 'fixtures/Simple.pm';
        Simple->CONFIG(template_path => 'fixtures');
        assert_equal(Simple->render(), <<'TEXT');
Hello Chris
You have just won $10000!
Well, $6000, after taxes.
TEXT
    }

    test ComplexView
    {
        require 'fixtures/ComplexView.pm';
        ComplexView->CONFIG(template_path => 'fixtures');
        assert_equal(ComplexView->render(), <<'HTML');
<h1>Colors</h1>

  <ul>
  
    
      <li><strong>red</strong></li>
    
    
  
    
    
      <li><a href="#Green">green</a></li>
    
  
    
    
      <li><a href="#Blue">blue</a></li>
    
  
  </ul>

HTML
    }
    
    test Partial
    {
        require 'fixtures/Partial.pm';
        Partial->CONFIG(template_path => 'fixtures');
        assert_equal(Partial->render(), <<'HTML');
<h1>Welcome</h1>
Hello Bob
You have just won $1000!
Well, $600, after taxes.

<h2>Fair enough, right?</h2>
HTML
    }
}