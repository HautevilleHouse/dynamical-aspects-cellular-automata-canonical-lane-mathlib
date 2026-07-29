import canonicalLaneMathlib.AdmissibleClass
import DynamicalAspectsCellularAutomataCanonicalLaneLean.CellularAutomataDynamics
import DynamicalAspectsCellularAutomataCanonicalLaneLean.TopologicalEntropy

namespace HautevilleHouse
namespace DynamicalAspectsCellularAutomataCanonicalLaneLean

structure ClassificationPackage where
  automatonClass : CellularAutomaton
  dynamicsClass : DynamicalProperties
  entropyClass : TopologicalEntropyPackage
  classificationCondition : Prop

def ClassificationClosed (C : ClassificationPackage) : Prop :=
  DynamicalPropertiesClosed C.dynamicsClass ∧ TopologicalEntropyClosed C.entropyClass

end DynamicalAspectsCellularAutomataCanonicalLaneLean
end HautevilleHouse