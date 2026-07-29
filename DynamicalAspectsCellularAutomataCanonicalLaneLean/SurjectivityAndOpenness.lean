import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalAspectsCellularAutomataCanonicalLaneLean

structure SurjectivityAndOpenness (A : CellularAutomaton) where
  SurjectiveGlobalRule : Prop
  OpenMap : Prop

structure SurjectivityOpennessEvidence (A : CellularAutomaton) (S : SurjectivityAndOpenness A) where
  surjectiveClosed : S.SurjectiveGlobalRule
  openMapClosed : S.OpenMap

def SurjectivityOpennessClosed (A : CellularAutomaton) (S : SurjectivityAndOpenness A) : Prop :=
  S.SurjectiveGlobalRule ∧ S.OpenMap

theorem surjectivity_openness_closed (A : CellularAutomaton) (S : SurjectivityAndOpenness A) (E : SurjectivityOpennessEvidence A S) :
    SurjectivityOpennessClosed A S := by
  exact And.intro E.surjectiveClosed E.openMapClosed

end DynamicalAspectsCellularAutomataCanonicalLaneLean
end HautevilleHouse