import canonicalLaneMathlib.AdmissibleClass
import DynamicalAspectsCellularAutomataCanonicalLaneLean.EntropyAndComplexity

namespace HautevilleHouse
namespace DynamicalAspectsCellularAutomataCanonicalLaneLean

structure UniversalityClassification (A : CellularAutomataAlgebra) where
  turingCompleteness : Prop
  computationalUniversality : Prop
  classificationType : Prop
  decidableProperties : Prop

structure UniversalityClassificationEvidence {A : CellularAutomataAlgebra}
    (U : UniversalityClassification A) where
  turingCompletenessClosed : U.turingCompleteness
  computationalUniversalityClosed : U.computationalUniversality
  classificationTypeClosed : U.classificationType
  decidablePropertiesClosed : U.decidableProperties

def UniversalityClassificationClosed {A : CellularAutomataAlgebra}
    (U : UniversalityClassification A) : Prop :=
  U.turingCompleteness ∧ U.computationalUniversality ∧ U.classificationType ∧ U.decidableProperties

theorem universality_classification_closed_from_evidence
    {A : CellularAutomataAlgebra} (U : UniversalityClassification A)
    (Ev : UniversalityClassificationEvidence U) : UniversalityClassificationClosed U := by
  exact And.intro Ev.turingCompletenessClosed
    (And.intro Ev.computationalUniversalityClosed
      (And.intro Ev.classificationTypeClosed Ev.decidablePropertiesClosed))

end DynamicalAspectsCellularAutomataCanonicalLaneLean
end HautevilleHouse
