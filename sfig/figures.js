require('./internal/sfig.js');
require('./internal/Graph.js');
require('./internal/RootedTree.js');
require('./internal/metapost.js');
require('./utils.js');

Text.defaults.setProperty('font', 'Times New Roman');

require('./openweb.js')
var prez = sfig.presentation();
prez.addSlide(extractionDataset().id('extractionDataset'));
prez.addSlide(extractionExample().id('extractionExample'));
prez.addSlide(extractionFeatureRecipe().id('extractionFeatureRecipe'));
prez.addSlide(extractionFeatureStructural().id('extractionFeatureStructural'));
prez.addSlide(extractionFeatureDenotation().id('extractionFeatureDenotation'));
prez.writePdf({outPrefix: 'openweb', combine: false});

require('./sempre.js')
prez = sfig.presentation();
prez.addSlide(framework().id('framework'));
prez.addSlide(knowledgeGraph().id('knowledgeGraph'));
prez.addSlide(beamsizePlot().id('beamsizePlot'));
prez.addSlide(newBeamPlot().id('newBeamPlot'));
prez.addSlide(predCountHistogram().id('predCountHistogram'));
prez.writePdf({outPrefix: 'sempre', combine: false});

require('./dpd.js');
prez = sfig.presentation();
prez.addSlide(exGrowth().id('exGrowth'));
prez.addSlide(exFloat().id('exFloat'));
prez.addSlide(knowledgeGraph().id('knowledgeGraph'));
prez.addSlide(dpdConcept().id('dpdConcept'));
prez.writePdf({outPrefix: 'dpd', combine: false});

require('./parsetrees.js');
prez = sfig.presentation();
prez.addSlide(baseParse().id('baseParse'));
prez.addSlide(macroParseOrig().id('macroParseOrig'));
prez.addSlide(macroParseMacro().id('macroParseMacro'));
prez.addSlide(macroParseSubMacros().id('macroParseSubMacros'));
prez.addSlide(dpdParse().id('dpdParse'));
prez.writePdf({outPrefix: 'parsetrees', combine: false});
