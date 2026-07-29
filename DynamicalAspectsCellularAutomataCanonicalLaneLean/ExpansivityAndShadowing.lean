import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalAspectsCellularAutomataCanonicalLaneLean

structure ExpansivityAndShadowing (A : CellularAutomaton) where
  ExpansiveConstant : ℕ
  ShadowingProperty : Prop
  SpecificationProperty : Prop

structure ExpansivityShadowingEvidence (A : CellularAutomaton) (E : ExpansivityAndShadowing A) where
  shadowingClosed : E.ShadowingProperty
  specificationClosed : E.SpecificationProperty

def ExpansivityShadowingClosed (A : CellularAutomaton) (E : ExpansivityAndShadowing A) : Prop :=
  E.ShadowingProperty ∧ E.SpecificationProperty

theorem expansivity_shadowing_closed (A : CellularAutomaton) (E : ExpansivityAndShadowing A) (Ev : ExpansivityShadowingEvidence A E) :
    ExpansivityShadowingClosed A E := by
  exact And.intro Ev.shadowingClosed Ev.specificationClosed

end DynamicalAspectsCellularAutomataCanonicalLaneLean
end HautevilleHouse